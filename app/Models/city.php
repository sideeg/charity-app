<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class city extends Model
{
    use HasFactory;

  
    public function state()
    {
         return $this->belongsTo('\App\Models\state','state_id','id');
    }
    public function country()
    {
         return $this->belongsTo('\App\Models\countrie','countrie_id','id');
    }
    
        // return $this->hasOneThrough(
        //     state::class,
        //     countrie::class,
           
        // );
    
}
