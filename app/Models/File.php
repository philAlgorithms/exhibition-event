<?php

namespace App\Models;

use App\Handler\Google\GoogleDrive;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\{BelongsTo};
use Illuminate\Support\Facades\Storage;

class File extends Model
{
    use HasFactory;
    /**
     * Gets the disk where this file is stored in
     * 
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function disk(): BelongsTo
    {
        return $this->belongsTo(Disk::class);
    }

    public function getUploadedToGoogleDriveAttribute(): bool{
        return !is_null($this->google_drive_id);
    }

    public function getUrlAttribute()
    {
        if($this->uploaded_to_google_drive)
        {
            $folder = config('services.google.temporaray_folder');
            $path = "{$folder}/{$this->google_drive_id}";

            if(!Storage::disk('public')->exists("{$path}"))
            {
                (new GoogleDrive)->download($this->google_drive_id);
            }
            
            return url("storage/{$path}");
        }
    }
}
