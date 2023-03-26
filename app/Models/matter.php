<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class matter extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo('\App\Models\Provider','provider_id','id');
    }

     public function initiator()
    {
        return $this->belongsTo('\App\Models\Provider','provider_id','id');
    }
     public function category()
    {
        return $this->belongsTo('\App\Models\categorie','categorie_id','id');
    }

    public function attachments()
	{
	   return $this->hasMany(matterAttachment::class);
	}

	public function updates()
	{
	   return $this->hasMany(matterUpdate::class);
	}
     public function views()
    {
       return $this->hasMany('\App\Models\userViews','matter_id','id');
    }
	public function updateAttachments()
    {
        return $this->hasManyThrough(
            matterUpdateAttachment::class,
            matterUpdate::class,
             'matter_id', // Local key on suppliers table...
            'matter_update_id', // Local key on products table...
            'id', // Foreign key on products table...
            'id', // Foreign key on orders table...
           
        );
    }
     public function contributors()
    {
        return $this->hasMany('App\Models\matterContributor','matter_id','id');
    }
     public function scopeOfCase($query, $provider)
    {
        return $query->where('provider_id', $provider);
    }
}
