<?php

namespace App\Http\Requests\Validators;


class EventDetailsValidator
{
    public function validate(array $attributes): array
    {
        $validated = validator(
            $attributes,
            [
                'event_name' => ['required', 'string', 'max:255'],
                'venue' => ['required', 'string', 'max:255'],
                'datetime' => ['required', 'string', 'max:255']
            ],
        )->validate();

        return $validated;
    }
}
