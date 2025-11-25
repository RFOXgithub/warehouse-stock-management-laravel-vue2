<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $primaryKey = 'item_id';
    protected $fillable  = ['item_id', 'kode_barang', 'nama_barang', 'satuan', 'stock_awal'];
}
