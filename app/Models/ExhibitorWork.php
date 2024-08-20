<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\{BelongsTo};

class ExhibitorWork extends Model
{
    use HasFactory;

    public function exhibitor(): BelongsTo
    {
        return $this->belongsTo(Exhibitor::class, 'exhibitor_id');
    }
    

    public function valueCurrency(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'value_currency_id');
    }

    public function disk(): BelongsTo
    {
        return $this->belongsTo(Disk::class, 'disk_id');
    }

    public function getphotographUrlAttribute(): string
    {
        return $this->disk->fileUrl($this->photograph, 5);
    }
}
