<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $guarded = ['id_customer'];
    protected $primaryKey = 'id_customer';
    protected $fillable = ['name', 'username', 'email', 'no_hp', 'password'];
    public $timestamps = false;
}
