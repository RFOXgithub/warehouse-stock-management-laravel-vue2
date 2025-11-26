<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BarangMasuk;
use Inertia\Inertia;

class BarangMasukController extends Controller
{
    public function barangmasuk()
    {
        $barangmasuk = BarangMasuk::latest()->get();
        return Inertia::render('barangmasuk/Index', compact('barangmasuk'));
    }

    public function create()
    {
        return Inertia::render('barangmasuk/Create', []);
    }
}
