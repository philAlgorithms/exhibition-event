<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExhibitorWorkResource extends JsonResource
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
            'title' => $this->title,
            'year' => $this->year,
            'description' => $this->description,
            'proposed_value' => $this->proposed_value,
            'photograph_url' => $this->photograph_url,
            'value_currency' => CurrencyResource::make($this->valueCurrency),
            'exhibitor' => ExhibitorResource::make($this->exhibitor),
        ];
    }
}
