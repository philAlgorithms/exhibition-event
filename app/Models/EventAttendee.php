<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\{BelongsTo};

class EventAttendee extends Model
{
    use HasFactory;
    
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function event(): BelongsTo
    {
        return $this->belongsTo(SanityDocument::class, 'event_id');
    }

    public function getCheckedInAttribute(): bool
    {
        return ! is_null($this->checked_in_at) && $this->checked_in_at < now();
    }

    public function checkIn()
    {
        if(! $this->checked_in)
        {
            return $this->update([
                'checked_in_at' => now()
            ]);
        }

        return false;
    }
}
