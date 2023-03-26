<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class categorie extends Model
{
    use HasFactory;
    public static function getCount(){
           
        return categorie::count();
    }
        protected $hidden = [
        'created_at',
        'updated_at',
    ];

}
