<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExhibitorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'bio' => $this->bio,
            'brand_name' => $this->brand_name,
            'headshot_url' => $this->headshot,
            'phone_number' => $this->phone_number,
            'years_of_experience' => $this->years_of_experience,
            'collection_title' => $this->collection_title,
            'collection_description' => $this->collection_description,
            'user' => UserResource::make($this->user),
            'publicity_mode' => $this->publicity_mode,
            'photography_genre' => PhotographyGenreResource::make($this->photographyGenre),
            'alt_photography_genre' => $this->alt_photography_genre,
            'works_used_by_external' => $this->works_used_by_external,
            'use_for_promotions' => $this->use_for_promotions,
            'works_count' => $this->works()->count(),
            'external_exhibitions' => ExternalExhibitionResource::collection($this->externalExhibitions),
            'created_at' => $this->created_at
        ];
    }
}
