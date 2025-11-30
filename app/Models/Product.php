<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $primaryKey = 'item_id';
    protected $fillable  = ['item_id', 'kode_barang', 'nama_barang', 'satuan', 'stock_awal'];

    public function barangmasuks(){
        return $this->hasMany(BarangMasuk::class, 'item_id', 'item_id');
        }
    
    public function barangkeluars(){
        return $this->hasMany(BarangKeluar::class,'item_id', 'item_id');
    }
}
