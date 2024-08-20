<?php

namespace App\Http\Resources;

use App\Http\Resources\Chat\ChatRoomResource;
use App\Http\Resources\Users\{AdminResource, ClientResource, TalentResource};
use App\Models\User;
use App\Models\Users\{Admin};
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'phone_number' => $this->phone_number,
            'email' => $this->email,
            'avatar_url' => $this->avatar_url,
            'is_admin' => $this->hasRole('admin'),
            'is_exhibitor' => $this->hasRole('exhibitor') && ! is_null($this->exhibitor)
        ];
    }
}
