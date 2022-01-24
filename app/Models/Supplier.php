<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;
    protected $primaryKey = 'id_supplier';
    protected $guarded = ['id_supplier'];
    public $timestamps = false;
    protected $fillable = ['nama_supplier', 'alamat', 'no_hp'];
    public function pembelian()
    {
        return $this->hasMany(Pembelian::class, 'id_supplier', 'id_supplier');
    }
}
