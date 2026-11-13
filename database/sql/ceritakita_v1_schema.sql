-- =====================================================================
-- CeritaKita - Database versi 1 (PostgreSQL)
-- Kelompok 5 PPPL B - Institut Teknologi Sepuluh Nopember
-- Sumber: ClassDiagram_Kelompok 5.pdf (class <<entity>>) dan
--         Critical Design Review_Kelompok 5.pdf (v1.0, 3 November 2026)
--
-- Aturan pemetaan (CDR bagian 2 dan 3):
--   * Setiap class <<entity>> menjadi satu tabel (nama snake_case).
--   * Class <<valueObject>> (TrenEmosiMingguan, DataPengguna) tidak
--     menjadi tabel karena nilainya dihitung saat ditampilkan.
--   * Atribut turunan bertanda "/" (profil./nama,
--     tarif_sesi./tarif_mahasiswa) tidak disimpan sebagai kolom.
--   * Tipe pada class diagram disesuaikan ke PostgreSQL:
--     tinyint -> smallint, datetime -> timestamp, bigint {PK} -> bigserial.
-- =====================================================================

-- ---------- UC-1 Login dan Mood ----------

CREATE TABLE akun_pengguna (
    id                      bigserial    PRIMARY KEY,
    nama                    varchar(100) NOT NULL,
    email                   varchar(254) NOT NULL UNIQUE,
    password_hash           varchar(255) NOT NULL,
    peran                   varchar(20)  NOT NULL,
    mahasiswa_terverifikasi boolean      NOT NULL DEFAULT false
);

CREATE TABLE sesi_login (
    id            varchar(255) PRIMARY KEY,
    akun_id       bigint       REFERENCES akun_pengguna (id),
    is_anonymous  boolean      NOT NULL DEFAULT false,
    ip_address    varchar(45)  NOT NULL,
    last_activity timestamp    NOT NULL
);

CREATE TABLE skala_mood (
    id        bigserial   PRIMARY KEY,
    nilai     smallint    NOT NULL,
    deskripsi varchar(50) NOT NULL
);

CREATE TABLE label_emosi (
    id   bigserial   PRIMARY KEY,
    nama varchar(50) NOT NULL
);

CREATE TABLE catatan_mood (
    id             bigserial PRIMARY KEY,
    akun_id        bigint    NOT NULL REFERENCES akun_pengguna (id),
    tanggal        date      NOT NULL,
    skala_id       bigint    NOT NULL REFERENCES skala_mood (id),
    label_emosi_id bigint    NOT NULL REFERENCES label_emosi (id),
    created_at     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE streak_harian (
    id               bigserial PRIMARY KEY,
    akun_id          bigint    NOT NULL UNIQUE REFERENCES akun_pengguna (id),
    jumlah_hari      integer   NOT NULL DEFAULT 0,
    tanggal_terakhir date      NOT NULL
);

-- ---------- UC-2 Pernapasan dan Musik ----------

CREATE TABLE panduan_durasi_pernapasan (
    id                   bigserial    PRIMARY KEY,
    nama                 varchar(100) NOT NULL,
    tarik_detik          integer      NOT NULL,
    tahan_detik          integer      NOT NULL,
    hembus_detik         integer      NOT NULL,
    durasi_latihan_detik integer      NOT NULL
);

CREATE TABLE sesi_pernapasan (
    id           bigserial   PRIMARY KEY,
    akun_id      bigint      REFERENCES akun_pengguna (id),
    panduan_id   bigint      NOT NULL REFERENCES panduan_durasi_pernapasan (id),
    mulai_at     timestamp   NOT NULL,
    selesai_at   timestamp,
    durasi_detik integer     NOT NULL,
    status       varchar(20) NOT NULL
);

CREATE TABLE musik_relaksasi (
    id           bigserial    PRIMARY KEY,
    judul        varchar(100) NOT NULL,
    deskripsi    varchar(255) NOT NULL,
    audio_path   varchar(255) NOT NULL,
    durasi_detik integer      NOT NULL
);

CREATE TABLE status_pemutaran_musik (
    id                 bigserial   PRIMARY KEY,
    sesi_pernapasan_id bigint      NOT NULL REFERENCES sesi_pernapasan (id),
    musik_id           bigint      NOT NULL REFERENCES musik_relaksasi (id),
    posisi_detik       integer     NOT NULL,
    status             varchar(20) NOT NULL,
    updated_at         timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- UC-3 Chat AI ----------

CREATE TABLE mode_chat (
    id        bigserial   PRIMARY KEY,
    nama      varchar(50) NOT NULL,
    kode      varchar(20) NOT NULL,
    deskripsi text        NOT NULL
);

CREATE TABLE percakapan_ai (
    id           bigserial   PRIMARY KEY,
    akun_id      bigint      NOT NULL REFERENCES akun_pengguna (id),
    mode_chat_id bigint      NOT NULL REFERENCES mode_chat (id),
    status       varchar(20) NOT NULL,
    created_at   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pesan (
    id            bigserial   PRIMARY KEY,
    percakapan_id bigint      NOT NULL REFERENCES percakapan_ai (id),
    pengirim      varchar(20) NOT NULL,
    isi           text        NOT NULL,
    created_at    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE saran_balasan_cepat (
    id       bigserial    PRIMARY KEY,
    pesan_id bigint       NOT NULL REFERENCES pesan (id),
    teks     varchar(255) NOT NULL,
    urutan   smallint     NOT NULL
);

-- ---------- UC-4 Jurnal dan Refleksi ----------

CREATE TABLE prompt_jurnal (
    id      bigserial PRIMARY KEY,
    tanggal date      NOT NULL UNIQUE,
    teks    text      NOT NULL
);

CREATE TABLE draft_jurnal (
    id         bigserial PRIMARY KEY,
    akun_id    bigint    NOT NULL REFERENCES akun_pengguna (id),
    tanggal    date      NOT NULL,
    judul      varchar(150),
    konten     text,
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE entri_jurnal (
    id         bigserial    PRIMARY KEY,
    akun_id    bigint       NOT NULL REFERENCES akun_pengguna (id),
    prompt_id  bigint       REFERENCES prompt_jurnal (id),
    tanggal    date         NOT NULL,
    judul      varchar(150) NOT NULL,
    konten     text         NOT NULL,
    created_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ringkasan_refleksi (
    id         bigserial PRIMARY KEY,
    jurnal_id  bigint    NOT NULL UNIQUE REFERENCES entri_jurnal (id),
    tanggal    date      NOT NULL,
    ringkasan  text      NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- UC-5 Decision dan Crisis Support ----------

CREATE TABLE kategori_keputusan (
    id        bigserial    PRIMARY KEY,
    nama      varchar(100) NOT NULL,
    deskripsi text
);

CREATE TABLE sesi_decision_support (
    id          bigserial   PRIMARY KEY,
    akun_id     bigint      NOT NULL REFERENCES akun_pengguna (id),
    kategori_id bigint      REFERENCES kategori_keputusan (id),
    status      varchar(20) NOT NULL,
    created_at  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE opsi_pertimbangan (
    id               bigserial    PRIMARY KEY,
    sesi_decision_id bigint       NOT NULL REFERENCES sesi_decision_support (id),
    nama             varchar(150) NOT NULL,
    kelebihan        text         NOT NULL,
    kekurangan       text         NOT NULL,
    urutan           smallint     NOT NULL
);

CREATE TABLE rekomendasi_langkah (
    id               bigserial PRIMARY KEY,
    sesi_decision_id bigint    NOT NULL REFERENCES sesi_decision_support (id),
    isi              text      NOT NULL,
    urutan           smallint  NOT NULL
);

-- ---------- UC-6 Psikolog dan Pemesanan, UC-9 Fitur Psikolog ----------

CREATE TABLE psikolog (
    id               bigserial    PRIMARY KEY,
    akun_id          bigint       NOT NULL UNIQUE REFERENCES akun_pengguna (id),
    nama             varchar(100) NOT NULL,
    pengalaman_tahun integer      NOT NULL,
    bio              text         NOT NULL,
    lokasi_praktik   varchar(255) NOT NULL
);

CREATE TABLE profil_praktik (
    id            bigserial PRIMARY KEY,
    psikolog_id   bigint    NOT NULL UNIQUE REFERENCES psikolog (id),
    pengalaman    text      NOT NULL,
    metode_terapi text      NOT NULL,
    updated_at    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE spesialisasi (
    id          bigserial    PRIMARY KEY,
    psikolog_id bigint       NOT NULL REFERENCES psikolog (id),
    nama        varchar(100) NOT NULL
);

CREATE TABLE tarif_sesi (
    id           bigserial      PRIMARY KEY,
    psikolog_id  bigint         NOT NULL REFERENCES psikolog (id),
    jenis_sesi   varchar(20)    NOT NULL,
    durasi_menit integer        NOT NULL,
    tarif_normal numeric(12, 2) NOT NULL
);

CREATE TABLE diskon_mahasiswa (
    id           bigserial      PRIMARY KEY,
    nama         varchar(100)   NOT NULL,
    jenis_diskon varchar(20)    NOT NULL,
    nilai        numeric(12, 2) NOT NULL,
    aktif        boolean        NOT NULL DEFAULT true
);

CREATE TABLE jadwal_praktik (
    id                bigserial   PRIMARY KEY,
    psikolog_id       bigint      NOT NULL REFERENCES psikolog (id),
    hari              varchar(10) NOT NULL,
    jam_mulai         time        NOT NULL,
    jam_selesai       time        NOT NULL,
    durasi_sesi_menit integer     NOT NULL
);

CREATE TABLE slot_waktu (
    id                bigserial   PRIMARY KEY,
    jadwal_praktik_id bigint      NOT NULL REFERENCES jadwal_praktik (id),
    tanggal           date        NOT NULL,
    jam_mulai         time        NOT NULL,
    jam_selesai       time        NOT NULL,
    status            varchar(20) NOT NULL,
    ditahan_oleh      bigint      REFERENCES akun_pengguna (id),
    ditahan_sampai    timestamp
);

CREATE TABLE sesi_konsultasi (
    id               bigserial   PRIMARY KEY,
    pengguna_id      bigint      NOT NULL REFERENCES akun_pengguna (id),
    psikolog_id      bigint      NOT NULL REFERENCES psikolog (id),
    slot_waktu_id    bigint      NOT NULL REFERENCES slot_waktu (id),
    tarif_sesi_id    bigint      NOT NULL REFERENCES tarif_sesi (id),
    jenis_sesi       varchar(20) NOT NULL,
    status           varchar(30) NOT NULL,
    waktu_mulai      timestamp   NOT NULL,
    waktu_selesai    timestamp   NOT NULL,
    dibuat_at        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    batas_pembayaran timestamp   NOT NULL,
    batas_konfirmasi timestamp
);

CREATE TABLE catatan_sesi (
    id      bigserial    PRIMARY KEY,
    sesi_id bigint       NOT NULL UNIQUE REFERENCES sesi_konsultasi (id),
    isi     varchar(500) NOT NULL
);

CREATE TABLE notifikasi (
    id         bigserial PRIMARY KEY,
    akun_id    bigint    NOT NULL REFERENCES akun_pengguna (id),
    sesi_id    bigint    REFERENCES sesi_konsultasi (id),
    isi        text      NOT NULL,
    dibaca_at  timestamp,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE panduan_persiapan_sesi (
    id     bigserial    PRIMARY KEY,
    judul  varchar(100) NOT NULL,
    isi    text         NOT NULL,
    urutan integer      NOT NULL
);

CREATE TABLE pembayaran (
    id             bigserial      PRIMARY KEY,
    sesi_id        bigint         NOT NULL REFERENCES sesi_konsultasi (id),
    diskon_id      bigint         REFERENCES diskon_mahasiswa (id),
    metode         varchar(30)    NOT NULL,
    tarif_awal     numeric(12, 2) NOT NULL,
    diskon         numeric(12, 2) NOT NULL DEFAULT 0,
    total          numeric(12, 2) NOT NULL,
    status         varchar(20)    NOT NULL,
    gateway_ref    varchar(100)   UNIQUE,
    kedaluwarsa_at timestamp      NOT NULL,
    lunas_at       timestamp
);

CREATE TABLE pengembalian_dana (
    id            bigserial      PRIMARY KEY,
    pembayaran_id bigint         NOT NULL UNIQUE REFERENCES pembayaran (id),
    jumlah        numeric(12, 2) NOT NULL,
    alasan        text           NOT NULL,
    status        varchar(20)    NOT NULL,
    gateway_ref   varchar(100),
    created_at    timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- UC-7 Sesi Saya dan Ulasan, UC-9.4 Catatan Hasil Sesi ----------

CREATE TABLE ulasan (
    id          bigserial PRIMARY KEY,
    sesi_id     bigint    NOT NULL UNIQUE REFERENCES sesi_konsultasi (id),
    psikolog_id bigint    NOT NULL REFERENCES psikolog (id),
    pengguna_id bigint    NOT NULL REFERENCES akun_pengguna (id),
    rating      smallint  NOT NULL,
    komentar    text,
    created_at  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE catatan_hasil_sesi (
    id          bigserial PRIMARY KEY,
    sesi_id     bigint    NOT NULL UNIQUE REFERENCES sesi_konsultasi (id),
    ringkasan   text      NOT NULL,
    rekomendasi text      NOT NULL,
    created_at  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ---------- UC-8 Profil, Privasi dan Ekspor ----------

CREATE TABLE profil (
    id         bigserial PRIMARY KEY,
    akun_id    bigint    NOT NULL UNIQUE REFERENCES akun_pengguna (id),
    foto_path  varchar(255),
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pengaturan_privasi (
    id          bigserial PRIMARY KEY,
    akun_id     bigint    NOT NULL UNIQUE REFERENCES akun_pengguna (id),
    mode_anonim boolean   NOT NULL DEFAULT false,
    updated_at  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE kunci_enkripsi (
    id            bigserial    PRIMARY KEY,
    akun_id       bigint       NOT NULL REFERENCES akun_pengguna (id),
    key_reference varchar(255) NOT NULL,
    algoritma     varchar(50)  NOT NULL,
    created_at    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE file_data (
    id          bigserial    PRIMARY KEY,
    akun_id     bigint       NOT NULL REFERENCES akun_pengguna (id),
    nama_file   varchar(255) NOT NULL,
    format_file varchar(10)  NOT NULL,
    file_path   varchar(255) NOT NULL,
    created_at  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
);
