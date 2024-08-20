<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Disk extends Model
{
    use HasFactory;

    public function fileUrl(string $path, ?int $minutes = 5)
    {
        $name = $this->name;
        if ($name == 'public') {
            return url($path);
        } else if ($name == 'do' || $name == 's3') {
            return Storage::disk($name)->temporaryUrl($path, now()->addMinutes($minutes), [
                'header' => ['Content-Disposition' => 'attachment']
            ]);
        } else
            return null;
    }
}
