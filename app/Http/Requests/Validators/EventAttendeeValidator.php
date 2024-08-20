<?php

namespace App\Http\Requests\Validators;

use Illuminate\Database\Query\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class EventAttendeeValidator
{
    public function validateRegistration(array $attributes): array
    {
        $validated= validator(
            $attributes,
            [
                'email' => ['email:rfc', Rule::unique('users', 'email')->where(fn (Builder $query) => $query->whereExists(function (Builder $query) {
                    $query->select(DB::raw(1))
                          ->from('event_attendees')
                          ->whereColumn('users.id', 'event_attendees.user_id');
                }))],
                'first_name' => ['required', 'string', 'max:255'],
                'last_name' => ['required', 'string', 'max:255'],
                'gender' => ['required', 'string', 'max:255', 'in:male,female'],
                'occupation' => ['required', 'string', 'max:255'],
                'publicity_mode' => ['required', 'string', 'max:255'],
                'phone_number' => ['required', 'string', 'regex:' . config('app.custom.phone_number_pattern')],
                // 'event_id' => ['required', 'numeric', Rule::exists('sanity_documents', 'id')],
            ],
            [
                'first_name.required' => 'Please provide the first name',
                'last_name.required' => 'Please provide the last name',
                'phone_number.regex' => 'This is not a valid Nigerian phone number',
            ]
        )->validate();

        return $validated;
    }
}
