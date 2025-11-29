<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Inertia\Inertia;

use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index()
    {
        $reports = Product::leftjoin('barang_keluars', 'products.item_id', '=', 'barang_keluars.item_id')
            ->leftjoin('barang_masuks', 'products.item_id', '=', 'barang_masuks.item_id')
            ->select('products.item_id', 'products.kode_barang', 'products.nama_barang', 'products.satuan', 'products.stock_awal', 'barang_keluars.jumlah_keluar', 'barang_masuks.jumlah_masuk', 'barang_keluars.tanggal AS tanggal_keluar', 'barang_masuks.tanggal AS tanggal_masuk')
            ->get();
        
        return Inertia::render('reports/Index', compact('reports'));
    }
}
