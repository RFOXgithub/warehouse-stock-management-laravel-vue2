<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\BarangKeluar;
use Inertia\Inertia;

use Illuminate\Http\Request;

class BarangKeluarController extends Controller
{
    public function barangkeluar()
    {
        $barangkeluar = Product::join('barang_keluars', 'products.item_id', '=', 'barang_keluars.item_id')
            ->select('products.kode_barang', 'products.nama_barang', 'barang_keluars.tanggal', 'barang_keluars.jumlah_keluar', 'barang_keluars.keterangan', 'barang_keluars.id')
            ->get();

        return Inertia::render('barangkeluar/Index', compact('barangkeluar'));
    }

    public function create()
    {
        $product = Product::select('item_id', 'kode_barang', 'nama_barang')->get();

        return Inertia::render('barangkeluar/Create', ['product' => $product]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'item_id' => 'required|numeric',
            'tanggal' => 'required|date',
            'jumlah_keluar' => 'required|numeric|min:1',
            'keterangan' => 'required|string|max:255',
        ]);

        BarangKeluar::create($data);
        return redirect()->route('barangkeluar.index')->with('message', 'Outgoing Product added successfully');
    }

    public function edit(BarangKeluar $product)
    {
        $barangkeluar = Product::join('barang_keluars', 'products.item_id', '=', 'barang_keluars.item_id')
            ->where('barang_keluars.id', $product->id)
            ->select('products.item_id', 'products.kode_barang', 'products.nama_barang', 'barang_keluars.tanggal', 'barang_keluars.jumlah_keluar', 'barang_keluars.keterangan', 'barang_keluars.id')
            ->first();

        $productOps = Product::select('item_id', 'kode_barang', 'nama_barang')->get();

        return Inertia::render('barangkeluar/Edit', [
            'product'        => $barangkeluar,
            'barangkeluarops' => $productOps,
        ]);
    }

    public function update(Request $request, BarangKeluar $product)
    {
        $request->validate([
            'item_id' => 'required|numeric',
            'tanggal' => 'required|date',
            'jumlah_keluar' => 'required|numeric|min:1',
            'keterangan' => 'required|string|max:255',
        ]);

        $product->update([
            'item_id' => $request->input('item_id'),
            'tanggal' => $request->input('tanggal'),
            'jumlah_keluar' => $request->input('jumlah_keluar'),
            'keterangan' => $request->input('keterangan'),
        ]);

        return redirect()->route('barangkeluar.index')->with('message', 'Outgoing Product updated successfully');
    }

    public function destroy(BarangKeluar $product)
    {
        $product->delete();
        return redirect()->route('barangkeluar.index')->with('message', 'Outgoing Product deleted successfully');
    }
}
