<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['id_kategori', 'berat', 'nama_barang', 'harga', 'jumlah', 'deskripsi', 'gambar'];
    public $timestamps = false;
    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? false, function($query, $search){
            return $query->where('nama_barang', 'like', '%' . $search . '%');
        });

        $query->when($filters['category'] ?? false, function($query, $category){
            return $query->whereHas('category', function($query) use ($category){
                $query->where('nama_kategori', $category);
            });
        });
        if ($filters['sort'] ?? false) {
           if($filters['sort'] == 'price'){
                $query->where('jumlah', '>=', 1)->orderBy('harga', 'ASC');
           } elseif($filters['sort'] == 'recent') {
                $query->where('jumlah', '>=', 1)->orderBy('id_product', 'DESC');
           }
        }
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'id_kategori');
    }


    public function getRouteKeyName()
    {
        return 'id_product';
    }
}
