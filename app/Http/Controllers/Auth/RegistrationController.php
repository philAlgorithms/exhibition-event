<?php

namespace App\Http\Controllers\Auth;

use App\Http\Requests\Validators\{EventAttendeeValidator, EventDetailsValidator, ExhibitorValidator, ExhibitorWorkValidator, UserValidator};
use App\Http\Resources\UserResource;
use App\Mail\Event\EventRegistered;
use App\Mail\Exhibition\TheForgottenCountry\RegistrationCompleted;
use App\Models\{Disk, Exhibitor, SanityDocument, User};
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class RegistrationController
{
    public function registerExhibitor()
    {
        $attributes = request()->all();

        // return $attributes;
        $eventDetailsValidated = (new EventDetailsValidator)->validate(
            $attributes
        );

        $exhibitorValidated = (new ExhibitorValidator)->validate(
            $exhibitor = new Exhibitor(),
            $attributes
        );
        $portfolioValidated = (new ExhibitorWorkValidator)->validateMany(
            'portfolio',
            $attributes
        );

        $exhibitorValidated['works_used_by_external'] = binary($exhibitorValidated['works_used_by_external']);
        $exhibitorValidated['use_for_promotions'] = binary($exhibitorValidated['use_for_promotions']);
        $user = User::withTrashed()->firstWhere('email', $exhibitorValidated['email']) ?? new User();

        // return ['req'=>$attributes, 'processed' => $exhibitorValidated];
        if ($user->trashed()) {
            throw ValidationException::withMessages([
                'email' => 'Try using another e-mail address'
            ]);
        }
        if (!is_null($user->exhibitor)) {
            throw ValidationException::withMessages([
                'email' => 'You have already registered as an exhibitor'
            ]);
        }
        $user->fill([
            ...Arr::only($exhibitorValidated, ['first_name', 'last_name', 'email']),
            'password' => bcrypt(Str::password())
        ]);

        $disk = Disk::firstWhere('name', 'do') ?? Disk::firstWhere('name', 'public');
        $user = DB::transaction(function () use ($user, $exhibitorValidated, $portfolioValidated, $disk) {
            $user->save();
            $user->assignRole('exhibitor');

            $headshot = request()->file('headshot');
            $uuid = (string)Str::orderedUuid();
            $user_path = str_replace(' ', '-', $user->name);
            $user->update([
                'avatar' => $headshot->storeAs('headshots', "headshot-{$user_path}-{$uuid}.{$headshot->extension()}", $disk->name),
                'avatar_disk_id' => $disk->id
            ]);

            $exhibitor = $user->exhibitor()->create(Arr::except($exhibitorValidated, ['first_name', 'last_name', 'email', 'headshot', 'agreed_to_terms', 'external_exhibitions']));
            if (array_key_exists('external_exhibitions', $exhibitorValidated) && $exhibitorValidated['works_used_by_external']) {
                foreach ($exhibitorValidated['external_exhibitions'] as $value) {
                    $exhibitor->externalExhibitions()->create([
                        'title' => $value
                    ]);
                }
            }
            foreach ($portfolioValidated['portfolio'] as $i => $portfolio) {
                $work_uuid = (string)Str::orderedUuid();
                $fileX = request()->file("portfolio.{$i}.photograph");
                $exhibitor->works()->create([
                    ...Arr::except($portfolio, ['photograph']),
                    'photograph' => $fileX->storeAs(
                        'exhibitor-works',
                        "work-{$user_path}-{$work_uuid}.{$fileX->extension()}",
                        $disk->name
                    ),
                    'disk_id' => $disk->id
                ]);
            }
            return $user;
        });
        $user->refresh();

        Mail::to($user)
            ->send(new RegistrationCompleted(
                exhibitor: $user->exhibitor,
                venue: $eventDetailsValidated['venue'],
                datetime: $eventDetailsValidated['datetime'],
                event_name: $eventDetailsValidated['event_name']
            ));

        return UserResource::make(
            $user
        );
    }

    public function registerEventAttendee(SanityDocument $event)
    {
        $attributes = request()->all();


        $eventDetailsValidated = (new EventDetailsValidator)->validate(
            $attributes
        );

        $validated = (new EventAttendeeValidator)->validateRegistration(
            $attributes
        );

        $user = User::withTrashed()->firstWhere('email', $validated['email']) ?? new User();

        if ($user->trashed()) {
            throw ValidationException::withMessages([
                'email' => 'Try using another e-mail address'
            ]);
        }
        if (!$user->exists) {
            $user->fill([
                ...Arr::only($validated, ['first_name', 'last_name', 'email']),
                'password' => bcrypt(Str::password())
            ]);
        }

        $user = DB::transaction(function () use ($user, $event, $validated) {
            if (!$user->exists) {
                $user->save();
            }
            $user->assignRole('attendee');

            $str = Str::random(6);
            $str2 = Str::random();
            $attendee = $user->eventAttendee()->create([
                ...Arr::except($validated, ['first_name', 'last_name', 'email']),
                'event_id' => $event->id,
                'ticket_id' => $str . $str2
            ]);
            $attendee->update([
                'ticket_id' => $str . $attendee->id
            ]);
            return $user;
        });

        $user->refresh();

        Mail::to($user)
            // ->cc($moreUsers)
            // ->bcc($evenMoreUsers)
            ->send(new EventRegistered(
                attendee: $user->eventAttendee,
                venue: $eventDetailsValidated['venue'],
                datetime: $eventDetailsValidated['datetime'],
                event_name: $eventDetailsValidated['event_name']
            ));
        // event(new Registered($user));
        return UserResource::make(
            $user
        );
    }
}
