<?php

namespace App\Http\Requests\Validators;

use App\Models\{Exhibitor, PhotographyGenre};
use Closure;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class ExhibitorValidator
{
    public function validate(Exhibitor $exhibitor, array $attributes): array
    {
        $exists = $exhibitor->exists;
        $miscellanuesGenre = PhotographyGenre::firstWhere('key', 'GENRE_MISCELLANEOUS');
        $validated = validator(
            $attributes,
            [
                'email' => [
                    'email:rfc',
                    Rule::unique('users', 'email')->where(fn (Builder $query) => $query->whereExists(function (Builder $query) {
                        $query->select(DB::raw(1))
                            ->from('exhibitors')
                            ->whereColumn('users.id', 'exhibitors.user_id');
                    }))
                ],
                'first_name' => ['required', 'string', 'max:255'],
                'last_name' => ['required', 'string', 'max:255'],
                'headshot' => [Rule::when($exists, 'sometimes'), 'required', 'image', 'mimes:jpg,png,jpeg,svg', 'max:4096'],

                'brand_name' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:2'],
                'bio' => [
                    Rule::when($exists, 'sometimes'), 'required', 'string', 'min:10',
                    function (string $attribute, mixed $value, Closure $fail) {
                        $word_count = count(explode(' ', $value));
                        if ($word_count > 50) {
                            $fail("Describe yourself with not more than 50 words. Your provided {$word_count} words.");
                        }
                    },
                ],
                'phone_number' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'regex:' . config('app.custom.phone_number_pattern')],
                'years_of_experience' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', 'min:1', 'max:70'],
                'collection_title' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:2'],
                'collection_description' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:10'],
                'headshot' => [Rule::when($exists, 'sometimes'), 'required', 'image', 'mimes:jpg,png,jpeg,svg', 'max:4096'],
                'photography_genre_id' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', Rule::exists('photography_genres', 'id')],
                'agreed_to_terms' => ['required', Rule::in([true, 'true'])],
                'works_used_by_external' => ['required', Rule::in([true, 'true', 'false', false])],
                'use_for_promotions' => ['required', Rule::in([true, 'true', 'false', false])],
                'publicity_mode' => ['required', 'string', 'max:255'],
                'alt_photography_genre' => ['required_if:photography_genre_id,' . $miscellanuesGenre->id, 'string', 'max:255'],
                'external_exhibitions' => ['required_if_accepted:works_used_by_external', 'array', 'min:1', 'max:10'],
                'external_exhibitions.*' => ['required', 'string'],
            ],
            [
                'first_name.required' => 'Please provide the first name',
                'last_name.required' => 'Please provide the last name',
                'headshot.required' => 'A headshot is required',

                'title.required' => 'The title is required',
                'year.min' => 'A photograph year must not be prior to :min.',
                'year.max' => 'A photograph year must not be later than :max.',
                'slug.regex' => 'The slug can contain only letters, numbers wand hyphens',
                'phone_number.regex' => 'This is not a valid Nigerian phone number',
                'alt_photography_genre.required_if' => "A photography genre must be specified when \'Others\' is selected",
                'external_exhibitions.required_if_accepted' => 'A list of the external exhibitions of your work(s) are required.',
                'agreed_to_terms.required' => 'You must agree to the terms and conditions',
                'agreed_to_terms.in' => 'You must agree to the terms and conditions'
            ]
        )->validate();

        return $validated;
    }
    public function validateUpdate(Exhibitor $exhibitor, array $attributes): array
    {
        $exists = $exhibitor->exists;
        $miscellanuesGenre = PhotographyGenre::firstWhere('key', 'GENRE_MISCELLANEOUS');
        $validated = validator(
            $attributes,
            [
                'brand_name' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:2'],
                'bio' => [
                    Rule::when($exists, 'sometimes'), 'required', 'string', 'min:10',
                    function (string $attribute, mixed $value, Closure $fail) {
                        $word_count = count(explode(' ', $value));
                        if ($word_count > 50) {
                            $fail("Describe yourself with not more than 50 words. Your provided {$word_count} words.");
                        }
                    },
                ],
                'years_of_experience' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', 'min:1', 'max:70'],
                'collection_title' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:2'],
                'collection_description' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'min:10'],
                'photography_genre_id' => [Rule::when($exists, 'sometimes'), 'required', 'numeric', Rule::exists('photography_genres', 'id')],
                'works_used_by_external' => [Rule::when($exists, 'sometimes'), 'required', Rule::in([true, 'true', 'false', false])],
                'use_for_promotions' => [Rule::when($exists, 'sometimes'), 'required', Rule::in([true, 'true', 'false', false])],
                'publicity_mode' => [Rule::when($exists, 'sometimes'), 'required', 'string', 'max:255'],
                'alt_photography_genre' => [Rule::when($exists, 'sometimes'), 'required_if:photography_genre_id,' . $miscellanuesGenre->id, 'string', 'max:255'],
                'external_exhibitions' => [Rule::when($exists, 'sometimes'), 'required_if_accepted:works_used_by_external', 'array', 'min:1', 'max:10'],
                'external_exhibitions.*' => [Rule::when($exists, 'sometimes'), 'required', 'string'],
            ],
            [
                'alt_photography_genre.required_if' => "A photography genre must be specified when \'Others\' is selected",
                'external_exhibitions.required_if_accepted' => 'A list of the external exhibitions of your work(s) are required.',
                'agreed_to_terms.required' => 'You must agree to the terms and conditions',
                'agreed_to_terms.in' => 'You must agree to the terms and conditions'
            ]
        )->validate();

        return $validated;
    }
}
