<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bankDetails extends Model
{
	  protected $hidden = array('created_at', 'updated_at');
    use HasFactory;
}
