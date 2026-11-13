<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Aturan kelompok
|--------------------------------------------------------------------------
| Tambahkan route hanya di blok modul milik pasangan Anda, supaya file ini
| tidak konflik saat merge. Tulis nama pembuat di komentar setiap route.
*/

Route::get('/', function () {
    return view('welcome');
});

// === Pasangan 1: UC-1 Login & Mood, UC-2 Pernapasan & Musik, UC-3 Chat AI ===


// === Pasangan 2: UC-4 Jurnal & Refleksi, UC-5 Decision & Crisis Support, UC-6 Psikolog & Pemesanan ===


// === Pasangan 3: UC-7 Sesi Saya & Ulasan, UC-8 Profil & Privasi, UC-9 Fitur Psikolog ===

