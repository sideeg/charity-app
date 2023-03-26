<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class matterContributor extends Model
{
    use HasFactory;
    protected $hidden = ['created_at', 'updated_at'];

    public function user()
    {
        return $this->belongsTo('App\Models\User','user_id','id');
    }
    public function case()
    {
        return $this->belongsTo('App\Models\matter','matter_id','id');
    }
    public function initiator()
    {
        return $this->hasOneThrough(
            Provider::class,
            matter::class,
            'id', // Foreign key on products table...
            'id', // Foreign key on orders table...
            'matter_id', // Local key on suppliers table...
            'provider_id' // Local key on products table...
        );
    }

}
