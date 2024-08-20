<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventAttendeeResource extends JsonResource
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
            'phone_number' => $this->phone_number,
            'occupation' => $this->occupation,
            'publicity_mode' => $this->publicity_mode,
            'collection_title' => $this->collection_title,
            'gender' => $this->gender,
            'ticket_id' => $this->ticket_id,
            'user' => UserResource::make($this->user),
            'sanity_document' => SanityDocumentResource::make($this->event),
            'created_at' => $this->created_at,
            'checked_in_at' => $this->checked_in_at,
            'checked_in' => $this->checked_in,
        ];
    }
}
