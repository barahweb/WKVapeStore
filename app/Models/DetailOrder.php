<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailOrder extends Model
{
    use HasFactory;
    // protected $table = 'detail_order';
    protected $fillable = ['id_product', 'id_order', 'quantity'];
    public $timestamps = false;
    public function order()
    {
        return $this->belongsTo(Cart::class, 'id_order', 'id_order');
    }
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'id_product', 'id_product');
    }
}
