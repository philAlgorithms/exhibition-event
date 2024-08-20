<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Notifications\Registration\VerifyEmailNotification;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\{BelongsTo, HasOne};
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Support\Str;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, HasApiTokens, Notifiable, CanResetPassword, HasRoles, SoftDeletes;


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function sendEmailVerificationNotification()
    {
        // We override the default notification and will use our own
        $this->notify(new VerifyEmailNotification());
    }

    public function avatarDisk(): BelongsTo
    {
        return $this->belongsTo(Disk::class, 'avatar_disk_id');
    }

    public function exhibitor(): HasOne
    {
        return $this->hasOne(Exhibitor::class, 'user_id');
    }

    public function eventAttendee(): HasOne
    {
        return $this->hasOne(EventAttendee::class, 'user_id');
    }

    public function getNameAttribute(): string
    {
        return "{$this->first_name} {$this->last_name}";
    }

    public function getAvatarUrlAttribute()
    {
        return is_null($this->avatar) ? null : $this->avatarDisk->fileUrl($this->avatar ?? '', 5);
    }

    public function generatePasswordToken(int $length)
    {
        $token = Str::random($length);
        DB::table(config('auth.logins.users.table'))->where('email', $this->email)->delete();
        DB::table(config('auth.logins.users.table'))->insert([
            'email' => $this->email,
            'token' => Hash::make($token),
            'created_at' => now()
        ]);

        return $token;
    }

    public function matchOneTimeLoginToken(string $token)
    {
        $row = DB::table(config('auth.logins.users.table'))->where('email', $this->email)->first();
        return is_null($row) ? false : Hash::check($token, $row->token);
    }
}
