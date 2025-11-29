<?php

use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\BarangMasukController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/products', [ProductController::class, 'index'])->name('products.index');
    Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
    Route::post('/products', [ProductController::class, 'store'])->name('products.store');
    Route::get('/products/{product}/edit', [ProductController::class, 'edit'])->name('products.edit');
    Route::put('/products/{product}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
    Route::get('/barangmasuk', [BarangMasukController::class, 'barangmasuk'])->name('barangmasuk.index');
    Route::get('/barangmasuk/create', [BarangMasukController::class, 'create'])->name('barangmasuk.create');
    Route::post('/barangmasuk', [BarangMasukController::class, 'store'])->name('barangmasuk.store');
    Route::delete('/barangmasuk/{product}', [BarangMasukController::class, 'destroy'])->name('barangmasuk.destroy');
    Route::get('/barangmasuk/{product}/edit', [BarangMasukController::class, 'edit'])->name('barangmasuk.edit');
    Route::put('/barangmasuk/{product}', [BarangMasukController::class, 'update'])->name('barangmasuk.update');
    Route::get('/barangkeluar', [BarangKeluarController::class, 'barangkeluar'])->name('barangkeluar.index');
    Route::get('/barangkeluar/create', [BarangKeluarController::class, 'create'])->name('barangkeluar.create');
    Route::post('/barangkeluar', [BarangKeluarController::class, 'store'])->name('barangkeluar.store');
    Route::get('/barangkeluar/{product}/edit', [BarangKeluarController::class, 'edit'])->name('barangkeluar.edit');
    Route::put('/barangkeluar/{product}', [BarangKeluarController::class, 'update'])->name('barangkeluar.update');
    Route::delete('/barangkeluar/{product}', [BarangKeluarController::class, 'destroy'])->name('barangkeluar.destroy');
});

require __DIR__ . '/settings.php';
