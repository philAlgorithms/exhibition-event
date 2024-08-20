<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\{BelongsTo, HasMany};

class Exhibitor extends Model
{
    use HasFactory;

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function works(): HasMany
    {
        return $this->hasMany(ExhibitorWork::class, 'exhibitor_id');
    }

    public function photographyGenre(): BelongsTo
    {
        return $this->belongsTo(PhotographyGenre::class, 'photography_genre_id');
    }

    public function externalExhibitions(): HasMany
    {
        return $this->hasMany(ExternalExhibition::class, 'exhibitor_id');
    }

    public function generateOneTimeLoginUrl()
    {
        $token = $this->user->generatePasswordToken(64);
        // return config('app.custom.frontend_url') . config('app.custom.frontend_login_path.exhibitor') . "?token={$token}";
        return config('app.custom.frontend_url')."/login/exhibitor?email={$this->user->email}&token={$token}";
    }

    public function getLoginPageUrlAttribute()
    {
        return config('app.custom.frontend_url') . config('app.custom.frontend_login_path.exhibitor');
    }
}
