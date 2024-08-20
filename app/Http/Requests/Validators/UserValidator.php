<?php

namespace App\Http\Requests\Validators;

use App\Models\{User};
use Illuminate\Validation\Rule;

class UserValidator
{
    public function validate(User $user, array $attributes): array
    {
        $exists = $user->exists;
        $validated = validator(
            $attributes,
            [
                'email' => [Rule::when($exists, 'sometimes'), 'required', 'email', 'unique:users,email'],
                'first_name' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'max:255'],
                'last_name' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'max:255'],
                'headshot' => [Rule::when($exists, 'sometimes'), 'required','image','mimes:jpg,png,jpeg,svg', 'max:4096'],
            ],
            [
                'first_name.required' => 'Please provide the first name',
                'last_name.required' => 'Please provide the last name',
                'headshot.required' => 'A headshot is required',
            ]
        )->validate();

        return $validated;
    }
}
