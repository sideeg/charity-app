<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class state extends Model
{
    use HasFactory;

      public function country(){
        return $this->belongsTo('\App\Models\countrie','countrie_id','id');
       
    }
}
