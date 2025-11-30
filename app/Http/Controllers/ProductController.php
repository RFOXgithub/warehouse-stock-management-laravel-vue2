<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::orderByRaw('CAST(SUBSTRING(kode_barang, 5) AS UNSIGNED)')
            ->get();

        return Inertia::render('products/Index', compact('products'));
    }

    public function create()
    {
        $lastProduct = Product::orderBy('item_id', 'desc')->first();

        $number = intval(substr($lastProduct?->kode_barang ?? 'BRG-000', 4)) + 1;

        $newCode = 'BRG-' . str_pad($number, 3, '0', STR_PAD_LEFT);

        return Inertia::render('products/Create', ['newCode' => $newCode]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'kode_barang' => 'required|string|',
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|',
            'stock_awal' => 'required|numeric|min:1'
        ]);

        Product::create($data);
        return redirect()->route('products.index')->with('message', 'Product added successfully');
    }

    public function edit(Product $product)
    {
        return Inertia::render('products/Edit', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'kode_barang' => 'required|string|',
            'nama_barang' => 'required|string|max:255',
            'satuan' => 'required|string|',
            'stock_awal' => 'required|numeric|min:1'
        ]);

        $product->update([
            'kode_barang' => $request->input('kode_barang'),
            'nama_barang' => $request->input('nama_barang'),
            'satuan' => $request->input('satuan'),
            'stock_awal' => $request->input('stock_awal'),
        ]);

        return redirect()->route('products.index')->with('message', 'Product updated successfully');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('products.index')->with('message', 'Product deleted successfully');
    }
}
