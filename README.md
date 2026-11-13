# CeritaKita

Aplikasi pendamping kesehatan mental mahasiswa. Proyek mata kuliah Perancangan dan Pengembangan Perangkat Lunak (PPPL) kelas B, Institut Teknologi Sepuluh Nopember, Kelompok 5.

Isi dokumen ini diambil dari Bab 1 *Software Critical Design Review Document for CeritaKita* versi 1.0 (3 November 2026).

## Deskripsi produk

**Latar belakang.** Mahasiswa menghadapi tekanan akademik, sosial, dan finansial yang dapat memengaruhi kesehatan mental mereka. Banyak mahasiswa belum terbiasa mengenali dan mencatat kondisi emosinya sehari-hari. Di sisi lain, akses ke layanan psikolog masih terkendala biaya, proses pemesanan yang tidak praktis, serta kekhawatiran terhadap stigma dan privasi.

**Tujuan.** CeritaKita membantu pengguna memantau suasana hati harian, melakukan latihan pernapasan, menulis jurnal dengan refleksi berbantuan AI, bercerita kepada chatbot, menimbang keputusan, serta memesan sesi konsultasi dengan psikolog.

**Manfaat.** Mahasiswa lebih mengenali pola emosinya, memiliki ruang bercerita yang menjaga privasi melalui Mode Anonim, dan lebih mudah berkonsultasi dengan psikolog. Psikolog terbantu dalam mengelola jadwal praktik, mengonfirmasi permintaan sesi, dan mencatat hasil sesi.

## Aktor

| Aktor | Jenis | Peran |
| --- | --- | --- |
| Pengguna (mahasiswa) | Utama | Memakai seluruh fitur pendamping dan memesan sesi konsultasi |
| Psikolog | Utama | Mengelola jadwal, sesi, catatan hasil sesi, dan profil praktik |
| Layanan AI | Sistem eksternal | Memproses Chat AI dan menyusun Refleksi Harian |
| Payment Gateway | Sistem eksternal | Memproses pembayaran sesi konsultasi |

## Fitur dan use case

| Kelompok | Fitur | Use case |
| --- | --- | --- |
| UC-1 | Login, Mood Check-in, Tren Emosi | UC-1.1 sampai UC-1.3 |
| UC-2 | Breathing Space, Musik Relaksasi | UC-2.1, UC-2.2 |
| UC-3 | Chat AI (Mode Curhat dan Mode Solusi) | UC-3.1, UC-3.2 |
| UC-4 | Jurnal, Refleksi Harian | UC-4.1, UC-4.2 |
| UC-5 | Decision & Crisis Support | UC-5.1, UC-5.2 |
| UC-6 | Cari Psikolog, Booking Sesi Konsultasi | UC-6.1 sampai UC-6.5 |
| UC-7 | Sesi Saya, Rating & Ulasan | UC-7.1 sampai UC-7.5 |
| UC-8 | Profil, Mode Anonim, Ekspor Data | UC-8.1 sampai UC-8.3 |
| UC-9 | Fitur Psikolog | UC-9.1 sampai UC-9.6 |

## Anggota kelompok

| NRP | Nama | Username GitHub | Foto |
| --- | --- | --- | --- |
| 5026231191 | Dzakiyyah Nur A. H. | @dzakiyyaahh | _belum ditambahkan_ |
| 5026211155 | I Gede Mahawiyarta Priyadarsa | _belum diisi_ | _belum ditambahkan_ |
| 5026221062 | Putri Salsabilla Insani | _belum diisi_ | _belum ditambahkan_ |
| 5026221064 | Ghiar Ghoniyyu Atha Akbar | _belum diisi_ | _belum ditambahkan_ |
| 5026231072 | Arrivo Arsa Mevano | _belum diisi_ | _belum ditambahkan_ |
| 5026231153 | Fachry Fariska Ilham | _belum diisi_ | _belum ditambahkan_ |

## Pembagian tugas

Pembagian per modul, dua orang per pasangan. Nama anggota tiap pasangan diisi setelah disepakati.

| Pasangan | Modul | Jumlah use case | Anggota |
| --- | --- | --- | --- |
| 1 | UC-1, UC-2, UC-3 | 7 | _belum diisi_ |
| 2 | UC-4, UC-5, UC-6 | 9 | _belum diisi_ |
| 3 | UC-7, UC-8, UC-9 | 14 | _belum diisi_ |

## Teknologi

- PHP 8.2 atau lebih baru, Laravel 12, Eloquent ORM, pola MVC
- PostgreSQL
- Composer, Node.js dan npm (Vite)

## Cara setup

```bash
git clone https://github.com/dzakiyyaahh/ceritakita.git
cd ceritakita
composer install
cp .env.example .env        # lalu isi DB_PASSWORD sesuai PostgreSQL di laptop Anda
php artisan key:generate
createdb -U postgres ceritakita
psql -U postgres -d ceritakita -f database/sql/ceritakita_v1_schema.sql
npm install && npm run dev
php artisan serve
```

File `.env` tidak ikut di repo. Jangan pernah meng-commit file tersebut.

## Database

Struktur database versi 1 ada di `database/sql/`:

- `ceritakita_v1_schema.sql`: skrip `CREATE TABLE` (41 tabel), dipakai untuk impor.
- `ceritakita_v1.sql`: hasil export `pg_dump` dari struktur yang sama.

Setiap class `«entity»` pada class diagram menjadi satu tabel. Perubahan struktur setelah versi 1 harus dicatat beserta alasannya.

## Aturan kolaborasi

- `main` berisi kode stabil. `develop` adalah tempat integrasi. Setiap tugas dikerjakan di branch sendiri yang dibuat dari `develop`.
- Tidak ada yang push langsung ke `main` atau `develop`. Semua kode masuk lewat Pull Request dengan minimal satu review.
- Jangan push atau merge fitur yang belum bisa dijalankan.
- Tulis nama pembuat di komentar setiap file atau kelas, misalnya `// Dikerjakan oleh: Jea`.
- Tambahkan route hanya di blok modul milik pasangan Anda di `routes/web.php`.
- Format pesan commit: `feat:`, `fix:`, `style:`, `refactor:`, `docs:`, `chore:`.
