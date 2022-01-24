<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $fillable = ['id_order', 'id_customer', 'status', 'pdf', 'ongkir', 'ekspedisi', 'nomor_resi'];

    public function order()
    {
        return $this->hasMany(DetailOrder::class, 'id_order', 'id_order');
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'id_customer', 'id_customer');
    }
    public function shipping_address()
    {
        return $this->hasOne(ShippingAddress::class, 'id_order', 'id_order');
    }
}
