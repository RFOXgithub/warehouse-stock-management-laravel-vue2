<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Inertia\Inertia;
use Carbon\Carbon;

use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index()
    {
        $reports = Product::withsum('BarangMasuks', 'jumlah_masuk')
            ->withsum('BarangKeluars', 'jumlah_keluar')
            ->get()
            ->map(function ($item) {
                $item->stock_akhir = $item->stock_awal + $item->barang_masuks_sum_jumlah_masuk - $item->barang_keluars_sum_jumlah_keluar;
                return $item;
            });

        return Inertia::render('reports/Index', compact('reports'));
    }

    public function filter(Request $request)
    {

        $request->validate([
            'startdate' => 'required|date',
            'enddate' => 'required|date',
        ]);

        $startdate = $request->input('startdate');
        $enddate = $request->input('enddate');

        $reports = Product::withSum(['barangMasuks' => function ($q) use ($startdate, $enddate) {
            $q->when($startdate && $enddate, fn($q) => $q->whereBetween('tanggal', [$startdate, $enddate]));
        }], 'jumlah_masuk')
            ->withSum(['barangKeluars' => function ($q) use ($startdate, $enddate) {
                $q->when($startdate && $enddate, fn($q) => $q->whereBetween('tanggal', [$startdate, $enddate]));
            }], 'jumlah_keluar')

            ->get()
            ->map(function ($item) {
                $item->stock_akhir = $item->stock_awal + $item->barang_masuks_sum_jumlah_masuk - $item->barang_keluars_sum_jumlah_keluar;
                return $item;
            });

        return Inertia::render('reports/Index', ['reports' => $reports, 'startdate' => $startdate ? Carbon::parse($startdate)->format('F j, Y') : null,  'enddate'   => $enddate ? Carbon::parse($enddate)->format('F j, Y') : null,]);
    }
}
