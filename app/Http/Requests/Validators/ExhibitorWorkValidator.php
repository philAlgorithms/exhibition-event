<?php

namespace App\Http\Requests\Validators;

use App\Models\{ExhibitorWork, Plan};
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class ExhibitorWorkValidator
{
    public function validate(ExhibitorWork $exhibitorWork, array $attributes): array
    {
        $exists = $exhibitorWork->exists;
        $validated = validator(
            $attributes,
            [
                'title' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:2'],
                'description' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:10'],
                'year' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', 'min:1900', 'max:'.date("Y")],
                'proposed_value' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', 'min:1'],
                'photograph' => [Rule::when($exists, 'sometimes'), 'required','image','mimes:jpg,png,jpeg,svg', 'max:4096'],
                'value_currency_id' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', Rule::exists('currencies', 'id')],
                // 'slug' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'max:255', 'unique:charities,slug', 'regex:/^[a-z0-9]+(?:-[a-z0-9]+)*$/'],
            ],
            [
                'title.required' => 'The title is required',
                'year.min' => 'The year must not be prior to :min.',
                'year.max' => 'The year must not be later than :max.',
                'slug.regex' => 'The slug can contain only letters, numbers wand hyphens'
            ]
        )->validate();

        return $validated;
    }

    public function validateMany(string $field, array $attributes): array
    {
        $validated = validator(
            $attributes,
            [
                // 'portfolio' => ['required', 'array:title,description,year,proposed_value,photograph,currency_id', 'min:1', 'max:5'],
                'portfolio' => ['required', 'array', 'min:1', 'max:5'],
                'portfolio.*.title' => ['required', 'string', 'min:2'],
                'portfolio.*.description' => ['required', 'string', 'min:10'],
                'portfolio.*.year' => ['required', 'numeric', 'min:1900', 'max:'.date("Y")],
                'portfolio.*.proposed_value' => ['required', 'numeric', 'min:1'],
                'portfolio.*.photograph' => ['required','image','mimes:jpg,png,jpeg,svg', 'max:20480'],
                'portfolio.*.value_currency_id' => ['required', 'numeric', Rule::exists('currencies', 'id')],
                // 'slug' => ['required', 'string', 'max:255', 'unique:charities,slug', 'regex:/^[a-z0-9]+(?:-[a-z0-9]+)*$/'],
            ],
            [
                'portfolio.min' => 'You must upload at least :min work',
                'portfolio.max' => 'You can only upload at most :max works',
                'portfolio.*.title.required' => 'The title is required',
                'portfolio.*.year.min' => 'The year must not be prior to :min.',
                'portfolio.*.year.max' => 'The year must not be later than :max.',
                'portfolio.*.slug.regex' => 'The slug can contain only letters, numbers wand hyphens'
            ]
        )->validate();

        return $validated;
    }
}
