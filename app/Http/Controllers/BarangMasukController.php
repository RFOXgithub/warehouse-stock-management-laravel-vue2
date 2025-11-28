<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\BarangMasuk;
use Inertia\Inertia;

class BarangMasukController extends Controller
{
    public function barangmasuk()
    {
        $barangmasuk = Product::join('barang_masuks', 'products.item_id', '=', 'barang_masuks.item_id')
            ->select('products.kode_barang', 'products.nama_barang', 'barang_masuks.tanggal', 'barang_masuks.jumlah_masuk', 'barang_masuks.keterangan', 'barang_masuks.id')
            ->get();

        return Inertia::render('barangmasuk/Index', compact('barangmasuk'));
    }

    public function create()
    {
        $product = Product::select('item_id', 'kode_barang', 'nama_barang')->get();

        return Inertia::render('barangmasuk/Create', ['product' => $product]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'item_id' => 'required|numeric',
            'tanggal' => 'required|date',
            'jumlah_masuk' => 'required|numeric|min:0',
            'keterangan' => 'required|string|max:255',
        ]);

        BarangMasuk::create($data);
        return redirect()->route('barangmasuk.index')->with('message', 'Incoming Product added successfully');
    }

    public function destroy(BarangMasuk $product)
    {
        $product->delete();
        return redirect()->route('barangmasuk.index')->with('message', 'Incoming Product deleted successfully');
    }

    public function edit(BarangMasuk $product)
    {
        $barangmasuk = Product::join('barang_masuks', 'products.item_id', '=', 'barang_masuks.item_id')
            ->where('barang_masuks.id', $product->id)
            ->select('products.item_id','products.kode_barang', 'products.nama_barang', 'barang_masuks.tanggal', 'barang_masuks.jumlah_masuk', 'barang_masuks.keterangan', 'barang_masuks.id')
            ->first();

        $productOps = Product::select('item_id', 'kode_barang', 'nama_barang')->get();

        return Inertia::render('barangmasuk/Edit', [
            'product'        => $barangmasuk,
            'barangmasukops' => $productOps,
        ]);
    }


    public function update(Request $request, BarangMasuk $product)
    {
        $request->validate([
            'item_id' => 'required|numeric',
            'tanggal' => 'required|date',
            'jumlah_masuk' => 'required|numeric|min:0',
            'keterangan' => 'required|string|max:255',
        ]);

        $product->update([
            'item_id' => $request->input('item_id'),
            'tanggal' => $request->input('tanggal'),
            'jumlah_masuk' => $request->input('jumlah_masuk'),
            'keterangan' => $request->input('keterangan'),
        ]);

        return redirect()->route('barangmasuk.index')->with('message', 'Incoming Product updated successfully');
    }
}
