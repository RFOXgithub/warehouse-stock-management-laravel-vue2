<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BarangKeluar extends Model
{
    protected $fillable  = ['id', 'item_id', 'tanggal', 'jumlah_keluar', 'keterangan'];
}
