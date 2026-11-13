--
-- PostgreSQL database dump
--

\restrict oWZIEhjCwDOroBMQfXlV0JfTE5OK9ncJLkr2Vgpb0NQjOc19zNj9t6mEWmH2Sdf

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: akun_pengguna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.akun_pengguna (
    id bigint NOT NULL,
    nama character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    password_hash character varying(255) NOT NULL,
    peran character varying(20) NOT NULL,
    mahasiswa_terverifikasi boolean DEFAULT false NOT NULL
);


--
-- Name: akun_pengguna_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.akun_pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: akun_pengguna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.akun_pengguna_id_seq OWNED BY public.akun_pengguna.id;


--
-- Name: catatan_hasil_sesi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.catatan_hasil_sesi (
    id bigint NOT NULL,
    sesi_id bigint NOT NULL,
    ringkasan text NOT NULL,
    rekomendasi text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: catatan_hasil_sesi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.catatan_hasil_sesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: catatan_hasil_sesi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.catatan_hasil_sesi_id_seq OWNED BY public.catatan_hasil_sesi.id;


--
-- Name: catatan_mood; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.catatan_mood (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    tanggal date NOT NULL,
    skala_id bigint NOT NULL,
    label_emosi_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: catatan_mood_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.catatan_mood_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: catatan_mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.catatan_mood_id_seq OWNED BY public.catatan_mood.id;


--
-- Name: catatan_sesi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.catatan_sesi (
    id bigint NOT NULL,
    sesi_id bigint NOT NULL,
    isi character varying(500) NOT NULL
);


--
-- Name: catatan_sesi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.catatan_sesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: catatan_sesi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.catatan_sesi_id_seq OWNED BY public.catatan_sesi.id;


--
-- Name: diskon_mahasiswa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.diskon_mahasiswa (
    id bigint NOT NULL,
    nama character varying(100) NOT NULL,
    jenis_diskon character varying(20) NOT NULL,
    nilai numeric(12,2) NOT NULL,
    aktif boolean DEFAULT true NOT NULL
);


--
-- Name: diskon_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.diskon_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diskon_mahasiswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.diskon_mahasiswa_id_seq OWNED BY public.diskon_mahasiswa.id;


--
-- Name: draft_jurnal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.draft_jurnal (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    tanggal date NOT NULL,
    judul character varying(150),
    konten text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: draft_jurnal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.draft_jurnal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: draft_jurnal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.draft_jurnal_id_seq OWNED BY public.draft_jurnal.id;


--
-- Name: entri_jurnal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entri_jurnal (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    prompt_id bigint,
    tanggal date NOT NULL,
    judul character varying(150) NOT NULL,
    konten text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: entri_jurnal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entri_jurnal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entri_jurnal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entri_jurnal_id_seq OWNED BY public.entri_jurnal.id;


--
-- Name: file_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.file_data (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    nama_file character varying(255) NOT NULL,
    format_file character varying(10) NOT NULL,
    file_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: file_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.file_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.file_data_id_seq OWNED BY public.file_data.id;


--
-- Name: jadwal_praktik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jadwal_praktik (
    id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    hari character varying(10) NOT NULL,
    jam_mulai time without time zone NOT NULL,
    jam_selesai time without time zone NOT NULL,
    durasi_sesi_menit integer NOT NULL
);


--
-- Name: jadwal_praktik_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jadwal_praktik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jadwal_praktik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jadwal_praktik_id_seq OWNED BY public.jadwal_praktik.id;


--
-- Name: kategori_keputusan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kategori_keputusan (
    id bigint NOT NULL,
    nama character varying(100) NOT NULL,
    deskripsi text
);


--
-- Name: kategori_keputusan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kategori_keputusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kategori_keputusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kategori_keputusan_id_seq OWNED BY public.kategori_keputusan.id;


--
-- Name: kunci_enkripsi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kunci_enkripsi (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    key_reference character varying(255) NOT NULL,
    algoritma character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: kunci_enkripsi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kunci_enkripsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kunci_enkripsi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kunci_enkripsi_id_seq OWNED BY public.kunci_enkripsi.id;


--
-- Name: label_emosi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.label_emosi (
    id bigint NOT NULL,
    nama character varying(50) NOT NULL
);


--
-- Name: label_emosi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.label_emosi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: label_emosi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.label_emosi_id_seq OWNED BY public.label_emosi.id;


--
-- Name: mode_chat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mode_chat (
    id bigint NOT NULL,
    nama character varying(50) NOT NULL,
    kode character varying(20) NOT NULL,
    deskripsi text NOT NULL
);


--
-- Name: mode_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mode_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mode_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mode_chat_id_seq OWNED BY public.mode_chat.id;


--
-- Name: musik_relaksasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.musik_relaksasi (
    id bigint NOT NULL,
    judul character varying(100) NOT NULL,
    deskripsi character varying(255) NOT NULL,
    audio_path character varying(255) NOT NULL,
    durasi_detik integer NOT NULL
);


--
-- Name: musik_relaksasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.musik_relaksasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: musik_relaksasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.musik_relaksasi_id_seq OWNED BY public.musik_relaksasi.id;


--
-- Name: notifikasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifikasi (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    sesi_id bigint,
    isi text NOT NULL,
    dibaca_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: notifikasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifikasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifikasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifikasi_id_seq OWNED BY public.notifikasi.id;


--
-- Name: opsi_pertimbangan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opsi_pertimbangan (
    id bigint NOT NULL,
    sesi_decision_id bigint NOT NULL,
    nama character varying(150) NOT NULL,
    kelebihan text NOT NULL,
    kekurangan text NOT NULL,
    urutan smallint NOT NULL
);


--
-- Name: opsi_pertimbangan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opsi_pertimbangan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opsi_pertimbangan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.opsi_pertimbangan_id_seq OWNED BY public.opsi_pertimbangan.id;


--
-- Name: panduan_durasi_pernapasan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.panduan_durasi_pernapasan (
    id bigint NOT NULL,
    nama character varying(100) NOT NULL,
    tarik_detik integer NOT NULL,
    tahan_detik integer NOT NULL,
    hembus_detik integer NOT NULL,
    durasi_latihan_detik integer NOT NULL
);


--
-- Name: panduan_durasi_pernapasan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.panduan_durasi_pernapasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: panduan_durasi_pernapasan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.panduan_durasi_pernapasan_id_seq OWNED BY public.panduan_durasi_pernapasan.id;


--
-- Name: panduan_persiapan_sesi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.panduan_persiapan_sesi (
    id bigint NOT NULL,
    judul character varying(100) NOT NULL,
    isi text NOT NULL,
    urutan integer NOT NULL
);


--
-- Name: panduan_persiapan_sesi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.panduan_persiapan_sesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: panduan_persiapan_sesi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.panduan_persiapan_sesi_id_seq OWNED BY public.panduan_persiapan_sesi.id;


--
-- Name: pembayaran; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pembayaran (
    id bigint NOT NULL,
    sesi_id bigint NOT NULL,
    diskon_id bigint,
    metode character varying(30) NOT NULL,
    tarif_awal numeric(12,2) NOT NULL,
    diskon numeric(12,2) DEFAULT 0 NOT NULL,
    total numeric(12,2) NOT NULL,
    status character varying(20) NOT NULL,
    gateway_ref character varying(100),
    kedaluwarsa_at timestamp without time zone NOT NULL,
    lunas_at timestamp without time zone
);


--
-- Name: pembayaran_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pembayaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pembayaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pembayaran_id_seq OWNED BY public.pembayaran.id;


--
-- Name: pengaturan_privasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pengaturan_privasi (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    mode_anonim boolean DEFAULT false NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pengaturan_privasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pengaturan_privasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pengaturan_privasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pengaturan_privasi_id_seq OWNED BY public.pengaturan_privasi.id;


--
-- Name: pengembalian_dana; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pengembalian_dana (
    id bigint NOT NULL,
    pembayaran_id bigint NOT NULL,
    jumlah numeric(12,2) NOT NULL,
    alasan text NOT NULL,
    status character varying(20) NOT NULL,
    gateway_ref character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pengembalian_dana_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pengembalian_dana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pengembalian_dana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pengembalian_dana_id_seq OWNED BY public.pengembalian_dana.id;


--
-- Name: percakapan_ai; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.percakapan_ai (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    mode_chat_id bigint NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: percakapan_ai_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.percakapan_ai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: percakapan_ai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.percakapan_ai_id_seq OWNED BY public.percakapan_ai.id;


--
-- Name: pesan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pesan (
    id bigint NOT NULL,
    percakapan_id bigint NOT NULL,
    pengirim character varying(20) NOT NULL,
    isi text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: pesan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pesan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pesan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pesan_id_seq OWNED BY public.pesan.id;


--
-- Name: profil; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profil (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    foto_path character varying(255),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: profil_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profil_id_seq OWNED BY public.profil.id;


--
-- Name: profil_praktik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profil_praktik (
    id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    pengalaman text NOT NULL,
    metode_terapi text NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: profil_praktik_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profil_praktik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profil_praktik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profil_praktik_id_seq OWNED BY public.profil_praktik.id;


--
-- Name: prompt_jurnal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prompt_jurnal (
    id bigint NOT NULL,
    tanggal date NOT NULL,
    teks text NOT NULL
);


--
-- Name: prompt_jurnal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prompt_jurnal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prompt_jurnal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prompt_jurnal_id_seq OWNED BY public.prompt_jurnal.id;


--
-- Name: psikolog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.psikolog (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    nama character varying(100) NOT NULL,
    pengalaman_tahun integer NOT NULL,
    bio text NOT NULL,
    lokasi_praktik character varying(255) NOT NULL
);


--
-- Name: psikolog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.psikolog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: psikolog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.psikolog_id_seq OWNED BY public.psikolog.id;


--
-- Name: rekomendasi_langkah; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rekomendasi_langkah (
    id bigint NOT NULL,
    sesi_decision_id bigint NOT NULL,
    isi text NOT NULL,
    urutan smallint NOT NULL
);


--
-- Name: rekomendasi_langkah_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rekomendasi_langkah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rekomendasi_langkah_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rekomendasi_langkah_id_seq OWNED BY public.rekomendasi_langkah.id;


--
-- Name: ringkasan_refleksi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ringkasan_refleksi (
    id bigint NOT NULL,
    jurnal_id bigint NOT NULL,
    tanggal date NOT NULL,
    ringkasan text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ringkasan_refleksi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ringkasan_refleksi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ringkasan_refleksi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ringkasan_refleksi_id_seq OWNED BY public.ringkasan_refleksi.id;


--
-- Name: saran_balasan_cepat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saran_balasan_cepat (
    id bigint NOT NULL,
    pesan_id bigint NOT NULL,
    teks character varying(255) NOT NULL,
    urutan smallint NOT NULL
);


--
-- Name: saran_balasan_cepat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saran_balasan_cepat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: saran_balasan_cepat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saran_balasan_cepat_id_seq OWNED BY public.saran_balasan_cepat.id;


--
-- Name: sesi_decision_support; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesi_decision_support (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    kategori_id bigint,
    status character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: sesi_decision_support_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sesi_decision_support_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sesi_decision_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sesi_decision_support_id_seq OWNED BY public.sesi_decision_support.id;


--
-- Name: sesi_konsultasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesi_konsultasi (
    id bigint NOT NULL,
    pengguna_id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    slot_waktu_id bigint NOT NULL,
    tarif_sesi_id bigint NOT NULL,
    jenis_sesi character varying(20) NOT NULL,
    status character varying(30) NOT NULL,
    waktu_mulai timestamp without time zone NOT NULL,
    waktu_selesai timestamp without time zone NOT NULL,
    dibuat_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    batas_pembayaran timestamp without time zone NOT NULL,
    batas_konfirmasi timestamp without time zone
);


--
-- Name: sesi_konsultasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sesi_konsultasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sesi_konsultasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sesi_konsultasi_id_seq OWNED BY public.sesi_konsultasi.id;


--
-- Name: sesi_login; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesi_login (
    id character varying(255) NOT NULL,
    akun_id bigint,
    is_anonymous boolean DEFAULT false NOT NULL,
    ip_address character varying(45) NOT NULL,
    last_activity timestamp without time zone NOT NULL
);


--
-- Name: sesi_pernapasan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesi_pernapasan (
    id bigint NOT NULL,
    akun_id bigint,
    panduan_id bigint NOT NULL,
    mulai_at timestamp without time zone NOT NULL,
    selesai_at timestamp without time zone,
    durasi_detik integer NOT NULL,
    status character varying(20) NOT NULL
);


--
-- Name: sesi_pernapasan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sesi_pernapasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sesi_pernapasan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sesi_pernapasan_id_seq OWNED BY public.sesi_pernapasan.id;


--
-- Name: skala_mood; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skala_mood (
    id bigint NOT NULL,
    nilai smallint NOT NULL,
    deskripsi character varying(50) NOT NULL
);


--
-- Name: skala_mood_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.skala_mood_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skala_mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.skala_mood_id_seq OWNED BY public.skala_mood.id;


--
-- Name: slot_waktu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slot_waktu (
    id bigint NOT NULL,
    jadwal_praktik_id bigint NOT NULL,
    tanggal date NOT NULL,
    jam_mulai time without time zone NOT NULL,
    jam_selesai time without time zone NOT NULL,
    status character varying(20) NOT NULL,
    ditahan_oleh bigint,
    ditahan_sampai timestamp without time zone
);


--
-- Name: slot_waktu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slot_waktu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slot_waktu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slot_waktu_id_seq OWNED BY public.slot_waktu.id;


--
-- Name: spesialisasi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spesialisasi (
    id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    nama character varying(100) NOT NULL
);


--
-- Name: spesialisasi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.spesialisasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spesialisasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.spesialisasi_id_seq OWNED BY public.spesialisasi.id;


--
-- Name: status_pemutaran_musik; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status_pemutaran_musik (
    id bigint NOT NULL,
    sesi_pernapasan_id bigint NOT NULL,
    musik_id bigint NOT NULL,
    posisi_detik integer NOT NULL,
    status character varying(20) NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: status_pemutaran_musik_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_pemutaran_musik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: status_pemutaran_musik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_pemutaran_musik_id_seq OWNED BY public.status_pemutaran_musik.id;


--
-- Name: streak_harian; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.streak_harian (
    id bigint NOT NULL,
    akun_id bigint NOT NULL,
    jumlah_hari integer DEFAULT 0 NOT NULL,
    tanggal_terakhir date NOT NULL
);


--
-- Name: streak_harian_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.streak_harian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: streak_harian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.streak_harian_id_seq OWNED BY public.streak_harian.id;


--
-- Name: tarif_sesi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tarif_sesi (
    id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    jenis_sesi character varying(20) NOT NULL,
    durasi_menit integer NOT NULL,
    tarif_normal numeric(12,2) NOT NULL
);


--
-- Name: tarif_sesi_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tarif_sesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarif_sesi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tarif_sesi_id_seq OWNED BY public.tarif_sesi.id;


--
-- Name: ulasan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ulasan (
    id bigint NOT NULL,
    sesi_id bigint NOT NULL,
    psikolog_id bigint NOT NULL,
    pengguna_id bigint NOT NULL,
    rating smallint NOT NULL,
    komentar text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ulasan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ulasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ulasan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ulasan_id_seq OWNED BY public.ulasan.id;


--
-- Name: akun_pengguna id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.akun_pengguna ALTER COLUMN id SET DEFAULT nextval('public.akun_pengguna_id_seq'::regclass);


--
-- Name: catatan_hasil_sesi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_hasil_sesi ALTER COLUMN id SET DEFAULT nextval('public.catatan_hasil_sesi_id_seq'::regclass);


--
-- Name: catatan_mood id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_mood ALTER COLUMN id SET DEFAULT nextval('public.catatan_mood_id_seq'::regclass);


--
-- Name: catatan_sesi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_sesi ALTER COLUMN id SET DEFAULT nextval('public.catatan_sesi_id_seq'::regclass);


--
-- Name: diskon_mahasiswa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diskon_mahasiswa ALTER COLUMN id SET DEFAULT nextval('public.diskon_mahasiswa_id_seq'::regclass);


--
-- Name: draft_jurnal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_jurnal ALTER COLUMN id SET DEFAULT nextval('public.draft_jurnal_id_seq'::regclass);


--
-- Name: entri_jurnal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entri_jurnal ALTER COLUMN id SET DEFAULT nextval('public.entri_jurnal_id_seq'::regclass);


--
-- Name: file_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_data ALTER COLUMN id SET DEFAULT nextval('public.file_data_id_seq'::regclass);


--
-- Name: jadwal_praktik id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jadwal_praktik ALTER COLUMN id SET DEFAULT nextval('public.jadwal_praktik_id_seq'::regclass);


--
-- Name: kategori_keputusan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategori_keputusan ALTER COLUMN id SET DEFAULT nextval('public.kategori_keputusan_id_seq'::regclass);


--
-- Name: kunci_enkripsi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kunci_enkripsi ALTER COLUMN id SET DEFAULT nextval('public.kunci_enkripsi_id_seq'::regclass);


--
-- Name: label_emosi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label_emosi ALTER COLUMN id SET DEFAULT nextval('public.label_emosi_id_seq'::regclass);


--
-- Name: mode_chat id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mode_chat ALTER COLUMN id SET DEFAULT nextval('public.mode_chat_id_seq'::regclass);


--
-- Name: musik_relaksasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musik_relaksasi ALTER COLUMN id SET DEFAULT nextval('public.musik_relaksasi_id_seq'::regclass);


--
-- Name: notifikasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifikasi ALTER COLUMN id SET DEFAULT nextval('public.notifikasi_id_seq'::regclass);


--
-- Name: opsi_pertimbangan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opsi_pertimbangan ALTER COLUMN id SET DEFAULT nextval('public.opsi_pertimbangan_id_seq'::regclass);


--
-- Name: panduan_durasi_pernapasan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.panduan_durasi_pernapasan ALTER COLUMN id SET DEFAULT nextval('public.panduan_durasi_pernapasan_id_seq'::regclass);


--
-- Name: panduan_persiapan_sesi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.panduan_persiapan_sesi ALTER COLUMN id SET DEFAULT nextval('public.panduan_persiapan_sesi_id_seq'::regclass);


--
-- Name: pembayaran id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pembayaran ALTER COLUMN id SET DEFAULT nextval('public.pembayaran_id_seq'::regclass);


--
-- Name: pengaturan_privasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengaturan_privasi ALTER COLUMN id SET DEFAULT nextval('public.pengaturan_privasi_id_seq'::regclass);


--
-- Name: pengembalian_dana id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengembalian_dana ALTER COLUMN id SET DEFAULT nextval('public.pengembalian_dana_id_seq'::regclass);


--
-- Name: percakapan_ai id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.percakapan_ai ALTER COLUMN id SET DEFAULT nextval('public.percakapan_ai_id_seq'::regclass);


--
-- Name: pesan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesan ALTER COLUMN id SET DEFAULT nextval('public.pesan_id_seq'::regclass);


--
-- Name: profil id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil ALTER COLUMN id SET DEFAULT nextval('public.profil_id_seq'::regclass);


--
-- Name: profil_praktik id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil_praktik ALTER COLUMN id SET DEFAULT nextval('public.profil_praktik_id_seq'::regclass);


--
-- Name: prompt_jurnal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_jurnal ALTER COLUMN id SET DEFAULT nextval('public.prompt_jurnal_id_seq'::regclass);


--
-- Name: psikolog id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.psikolog ALTER COLUMN id SET DEFAULT nextval('public.psikolog_id_seq'::regclass);


--
-- Name: rekomendasi_langkah id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rekomendasi_langkah ALTER COLUMN id SET DEFAULT nextval('public.rekomendasi_langkah_id_seq'::regclass);


--
-- Name: ringkasan_refleksi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ringkasan_refleksi ALTER COLUMN id SET DEFAULT nextval('public.ringkasan_refleksi_id_seq'::regclass);


--
-- Name: saran_balasan_cepat id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saran_balasan_cepat ALTER COLUMN id SET DEFAULT nextval('public.saran_balasan_cepat_id_seq'::regclass);


--
-- Name: sesi_decision_support id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_decision_support ALTER COLUMN id SET DEFAULT nextval('public.sesi_decision_support_id_seq'::regclass);


--
-- Name: sesi_konsultasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi ALTER COLUMN id SET DEFAULT nextval('public.sesi_konsultasi_id_seq'::regclass);


--
-- Name: sesi_pernapasan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_pernapasan ALTER COLUMN id SET DEFAULT nextval('public.sesi_pernapasan_id_seq'::regclass);


--
-- Name: skala_mood id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skala_mood ALTER COLUMN id SET DEFAULT nextval('public.skala_mood_id_seq'::regclass);


--
-- Name: slot_waktu id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_waktu ALTER COLUMN id SET DEFAULT nextval('public.slot_waktu_id_seq'::regclass);


--
-- Name: spesialisasi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spesialisasi ALTER COLUMN id SET DEFAULT nextval('public.spesialisasi_id_seq'::regclass);


--
-- Name: status_pemutaran_musik id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_pemutaran_musik ALTER COLUMN id SET DEFAULT nextval('public.status_pemutaran_musik_id_seq'::regclass);


--
-- Name: streak_harian id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streak_harian ALTER COLUMN id SET DEFAULT nextval('public.streak_harian_id_seq'::regclass);


--
-- Name: tarif_sesi id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarif_sesi ALTER COLUMN id SET DEFAULT nextval('public.tarif_sesi_id_seq'::regclass);


--
-- Name: ulasan id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan ALTER COLUMN id SET DEFAULT nextval('public.ulasan_id_seq'::regclass);


--
-- Data for Name: akun_pengguna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.akun_pengguna (id, nama, email, password_hash, peran, mahasiswa_terverifikasi) FROM stdin;
\.


--
-- Data for Name: catatan_hasil_sesi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.catatan_hasil_sesi (id, sesi_id, ringkasan, rekomendasi, created_at) FROM stdin;
\.


--
-- Data for Name: catatan_mood; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.catatan_mood (id, akun_id, tanggal, skala_id, label_emosi_id, created_at) FROM stdin;
\.


--
-- Data for Name: catatan_sesi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.catatan_sesi (id, sesi_id, isi) FROM stdin;
\.


--
-- Data for Name: diskon_mahasiswa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.diskon_mahasiswa (id, nama, jenis_diskon, nilai, aktif) FROM stdin;
\.


--
-- Data for Name: draft_jurnal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.draft_jurnal (id, akun_id, tanggal, judul, konten, updated_at) FROM stdin;
\.


--
-- Data for Name: entri_jurnal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.entri_jurnal (id, akun_id, prompt_id, tanggal, judul, konten, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: file_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.file_data (id, akun_id, nama_file, format_file, file_path, created_at) FROM stdin;
\.


--
-- Data for Name: jadwal_praktik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jadwal_praktik (id, psikolog_id, hari, jam_mulai, jam_selesai, durasi_sesi_menit) FROM stdin;
\.


--
-- Data for Name: kategori_keputusan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kategori_keputusan (id, nama, deskripsi) FROM stdin;
\.


--
-- Data for Name: kunci_enkripsi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.kunci_enkripsi (id, akun_id, key_reference, algoritma, created_at) FROM stdin;
\.


--
-- Data for Name: label_emosi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.label_emosi (id, nama) FROM stdin;
\.


--
-- Data for Name: mode_chat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.mode_chat (id, nama, kode, deskripsi) FROM stdin;
\.


--
-- Data for Name: musik_relaksasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.musik_relaksasi (id, judul, deskripsi, audio_path, durasi_detik) FROM stdin;
\.


--
-- Data for Name: notifikasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifikasi (id, akun_id, sesi_id, isi, dibaca_at, created_at) FROM stdin;
\.


--
-- Data for Name: opsi_pertimbangan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.opsi_pertimbangan (id, sesi_decision_id, nama, kelebihan, kekurangan, urutan) FROM stdin;
\.


--
-- Data for Name: panduan_durasi_pernapasan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.panduan_durasi_pernapasan (id, nama, tarik_detik, tahan_detik, hembus_detik, durasi_latihan_detik) FROM stdin;
\.


--
-- Data for Name: panduan_persiapan_sesi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.panduan_persiapan_sesi (id, judul, isi, urutan) FROM stdin;
\.


--
-- Data for Name: pembayaran; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pembayaran (id, sesi_id, diskon_id, metode, tarif_awal, diskon, total, status, gateway_ref, kedaluwarsa_at, lunas_at) FROM stdin;
\.


--
-- Data for Name: pengaturan_privasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pengaturan_privasi (id, akun_id, mode_anonim, updated_at) FROM stdin;
\.


--
-- Data for Name: pengembalian_dana; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pengembalian_dana (id, pembayaran_id, jumlah, alasan, status, gateway_ref, created_at) FROM stdin;
\.


--
-- Data for Name: percakapan_ai; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.percakapan_ai (id, akun_id, mode_chat_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pesan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pesan (id, percakapan_id, pengirim, isi, created_at) FROM stdin;
\.


--
-- Data for Name: profil; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profil (id, akun_id, foto_path, updated_at) FROM stdin;
\.


--
-- Data for Name: profil_praktik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profil_praktik (id, psikolog_id, pengalaman, metode_terapi, updated_at) FROM stdin;
\.


--
-- Data for Name: prompt_jurnal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prompt_jurnal (id, tanggal, teks) FROM stdin;
\.


--
-- Data for Name: psikolog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.psikolog (id, akun_id, nama, pengalaman_tahun, bio, lokasi_praktik) FROM stdin;
\.


--
-- Data for Name: rekomendasi_langkah; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rekomendasi_langkah (id, sesi_decision_id, isi, urutan) FROM stdin;
\.


--
-- Data for Name: ringkasan_refleksi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ringkasan_refleksi (id, jurnal_id, tanggal, ringkasan, created_at) FROM stdin;
\.


--
-- Data for Name: saran_balasan_cepat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.saran_balasan_cepat (id, pesan_id, teks, urutan) FROM stdin;
\.


--
-- Data for Name: sesi_decision_support; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesi_decision_support (id, akun_id, kategori_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sesi_konsultasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesi_konsultasi (id, pengguna_id, psikolog_id, slot_waktu_id, tarif_sesi_id, jenis_sesi, status, waktu_mulai, waktu_selesai, dibuat_at, batas_pembayaran, batas_konfirmasi) FROM stdin;
\.


--
-- Data for Name: sesi_login; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesi_login (id, akun_id, is_anonymous, ip_address, last_activity) FROM stdin;
\.


--
-- Data for Name: sesi_pernapasan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesi_pernapasan (id, akun_id, panduan_id, mulai_at, selesai_at, durasi_detik, status) FROM stdin;
\.


--
-- Data for Name: skala_mood; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.skala_mood (id, nilai, deskripsi) FROM stdin;
\.


--
-- Data for Name: slot_waktu; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.slot_waktu (id, jadwal_praktik_id, tanggal, jam_mulai, jam_selesai, status, ditahan_oleh, ditahan_sampai) FROM stdin;
\.


--
-- Data for Name: spesialisasi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spesialisasi (id, psikolog_id, nama) FROM stdin;
\.


--
-- Data for Name: status_pemutaran_musik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.status_pemutaran_musik (id, sesi_pernapasan_id, musik_id, posisi_detik, status, updated_at) FROM stdin;
\.


--
-- Data for Name: streak_harian; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.streak_harian (id, akun_id, jumlah_hari, tanggal_terakhir) FROM stdin;
\.


--
-- Data for Name: tarif_sesi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tarif_sesi (id, psikolog_id, jenis_sesi, durasi_menit, tarif_normal) FROM stdin;
\.


--
-- Data for Name: ulasan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ulasan (id, sesi_id, psikolog_id, pengguna_id, rating, komentar, created_at) FROM stdin;
\.


--
-- Name: akun_pengguna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.akun_pengguna_id_seq', 1, false);


--
-- Name: catatan_hasil_sesi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.catatan_hasil_sesi_id_seq', 1, false);


--
-- Name: catatan_mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.catatan_mood_id_seq', 1, false);


--
-- Name: catatan_sesi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.catatan_sesi_id_seq', 1, false);


--
-- Name: diskon_mahasiswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.diskon_mahasiswa_id_seq', 1, false);


--
-- Name: draft_jurnal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.draft_jurnal_id_seq', 1, false);


--
-- Name: entri_jurnal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.entri_jurnal_id_seq', 1, false);


--
-- Name: file_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.file_data_id_seq', 1, false);


--
-- Name: jadwal_praktik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jadwal_praktik_id_seq', 1, false);


--
-- Name: kategori_keputusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kategori_keputusan_id_seq', 1, false);


--
-- Name: kunci_enkripsi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kunci_enkripsi_id_seq', 1, false);


--
-- Name: label_emosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.label_emosi_id_seq', 1, false);


--
-- Name: mode_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mode_chat_id_seq', 1, false);


--
-- Name: musik_relaksasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.musik_relaksasi_id_seq', 1, false);


--
-- Name: notifikasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifikasi_id_seq', 1, false);


--
-- Name: opsi_pertimbangan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.opsi_pertimbangan_id_seq', 1, false);


--
-- Name: panduan_durasi_pernapasan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.panduan_durasi_pernapasan_id_seq', 1, false);


--
-- Name: panduan_persiapan_sesi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.panduan_persiapan_sesi_id_seq', 1, false);


--
-- Name: pembayaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pembayaran_id_seq', 1, false);


--
-- Name: pengaturan_privasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pengaturan_privasi_id_seq', 1, false);


--
-- Name: pengembalian_dana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pengembalian_dana_id_seq', 1, false);


--
-- Name: percakapan_ai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.percakapan_ai_id_seq', 1, false);


--
-- Name: pesan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pesan_id_seq', 1, false);


--
-- Name: profil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profil_id_seq', 1, false);


--
-- Name: profil_praktik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profil_praktik_id_seq', 1, false);


--
-- Name: prompt_jurnal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prompt_jurnal_id_seq', 1, false);


--
-- Name: psikolog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.psikolog_id_seq', 1, false);


--
-- Name: rekomendasi_langkah_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rekomendasi_langkah_id_seq', 1, false);


--
-- Name: ringkasan_refleksi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ringkasan_refleksi_id_seq', 1, false);


--
-- Name: saran_balasan_cepat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.saran_balasan_cepat_id_seq', 1, false);


--
-- Name: sesi_decision_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesi_decision_support_id_seq', 1, false);


--
-- Name: sesi_konsultasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesi_konsultasi_id_seq', 1, false);


--
-- Name: sesi_pernapasan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesi_pernapasan_id_seq', 1, false);


--
-- Name: skala_mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skala_mood_id_seq', 1, false);


--
-- Name: slot_waktu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.slot_waktu_id_seq', 1, false);


--
-- Name: spesialisasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.spesialisasi_id_seq', 1, false);


--
-- Name: status_pemutaran_musik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_pemutaran_musik_id_seq', 1, false);


--
-- Name: streak_harian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.streak_harian_id_seq', 1, false);


--
-- Name: tarif_sesi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tarif_sesi_id_seq', 1, false);


--
-- Name: ulasan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ulasan_id_seq', 1, false);


--
-- Name: akun_pengguna akun_pengguna_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.akun_pengguna
    ADD CONSTRAINT akun_pengguna_email_key UNIQUE (email);


--
-- Name: akun_pengguna akun_pengguna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.akun_pengguna
    ADD CONSTRAINT akun_pengguna_pkey PRIMARY KEY (id);


--
-- Name: catatan_hasil_sesi catatan_hasil_sesi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_hasil_sesi
    ADD CONSTRAINT catatan_hasil_sesi_pkey PRIMARY KEY (id);


--
-- Name: catatan_hasil_sesi catatan_hasil_sesi_sesi_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_hasil_sesi
    ADD CONSTRAINT catatan_hasil_sesi_sesi_id_key UNIQUE (sesi_id);


--
-- Name: catatan_mood catatan_mood_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_mood
    ADD CONSTRAINT catatan_mood_pkey PRIMARY KEY (id);


--
-- Name: catatan_sesi catatan_sesi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_sesi
    ADD CONSTRAINT catatan_sesi_pkey PRIMARY KEY (id);


--
-- Name: catatan_sesi catatan_sesi_sesi_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_sesi
    ADD CONSTRAINT catatan_sesi_sesi_id_key UNIQUE (sesi_id);


--
-- Name: diskon_mahasiswa diskon_mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.diskon_mahasiswa
    ADD CONSTRAINT diskon_mahasiswa_pkey PRIMARY KEY (id);


--
-- Name: draft_jurnal draft_jurnal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_jurnal
    ADD CONSTRAINT draft_jurnal_pkey PRIMARY KEY (id);


--
-- Name: entri_jurnal entri_jurnal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entri_jurnal
    ADD CONSTRAINT entri_jurnal_pkey PRIMARY KEY (id);


--
-- Name: file_data file_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_data
    ADD CONSTRAINT file_data_pkey PRIMARY KEY (id);


--
-- Name: jadwal_praktik jadwal_praktik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jadwal_praktik
    ADD CONSTRAINT jadwal_praktik_pkey PRIMARY KEY (id);


--
-- Name: kategori_keputusan kategori_keputusan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategori_keputusan
    ADD CONSTRAINT kategori_keputusan_pkey PRIMARY KEY (id);


--
-- Name: kunci_enkripsi kunci_enkripsi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kunci_enkripsi
    ADD CONSTRAINT kunci_enkripsi_pkey PRIMARY KEY (id);


--
-- Name: label_emosi label_emosi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label_emosi
    ADD CONSTRAINT label_emosi_pkey PRIMARY KEY (id);


--
-- Name: mode_chat mode_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mode_chat
    ADD CONSTRAINT mode_chat_pkey PRIMARY KEY (id);


--
-- Name: musik_relaksasi musik_relaksasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musik_relaksasi
    ADD CONSTRAINT musik_relaksasi_pkey PRIMARY KEY (id);


--
-- Name: notifikasi notifikasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifikasi
    ADD CONSTRAINT notifikasi_pkey PRIMARY KEY (id);


--
-- Name: opsi_pertimbangan opsi_pertimbangan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opsi_pertimbangan
    ADD CONSTRAINT opsi_pertimbangan_pkey PRIMARY KEY (id);


--
-- Name: panduan_durasi_pernapasan panduan_durasi_pernapasan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.panduan_durasi_pernapasan
    ADD CONSTRAINT panduan_durasi_pernapasan_pkey PRIMARY KEY (id);


--
-- Name: panduan_persiapan_sesi panduan_persiapan_sesi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.panduan_persiapan_sesi
    ADD CONSTRAINT panduan_persiapan_sesi_pkey PRIMARY KEY (id);


--
-- Name: pembayaran pembayaran_gateway_ref_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_gateway_ref_key UNIQUE (gateway_ref);


--
-- Name: pembayaran pembayaran_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_pkey PRIMARY KEY (id);


--
-- Name: pengaturan_privasi pengaturan_privasi_akun_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengaturan_privasi
    ADD CONSTRAINT pengaturan_privasi_akun_id_key UNIQUE (akun_id);


--
-- Name: pengaturan_privasi pengaturan_privasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengaturan_privasi
    ADD CONSTRAINT pengaturan_privasi_pkey PRIMARY KEY (id);


--
-- Name: pengembalian_dana pengembalian_dana_pembayaran_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengembalian_dana
    ADD CONSTRAINT pengembalian_dana_pembayaran_id_key UNIQUE (pembayaran_id);


--
-- Name: pengembalian_dana pengembalian_dana_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengembalian_dana
    ADD CONSTRAINT pengembalian_dana_pkey PRIMARY KEY (id);


--
-- Name: percakapan_ai percakapan_ai_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.percakapan_ai
    ADD CONSTRAINT percakapan_ai_pkey PRIMARY KEY (id);


--
-- Name: pesan pesan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesan
    ADD CONSTRAINT pesan_pkey PRIMARY KEY (id);


--
-- Name: profil profil_akun_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT profil_akun_id_key UNIQUE (akun_id);


--
-- Name: profil profil_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT profil_pkey PRIMARY KEY (id);


--
-- Name: profil_praktik profil_praktik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil_praktik
    ADD CONSTRAINT profil_praktik_pkey PRIMARY KEY (id);


--
-- Name: profil_praktik profil_praktik_psikolog_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil_praktik
    ADD CONSTRAINT profil_praktik_psikolog_id_key UNIQUE (psikolog_id);


--
-- Name: prompt_jurnal prompt_jurnal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_jurnal
    ADD CONSTRAINT prompt_jurnal_pkey PRIMARY KEY (id);


--
-- Name: prompt_jurnal prompt_jurnal_tanggal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prompt_jurnal
    ADD CONSTRAINT prompt_jurnal_tanggal_key UNIQUE (tanggal);


--
-- Name: psikolog psikolog_akun_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.psikolog
    ADD CONSTRAINT psikolog_akun_id_key UNIQUE (akun_id);


--
-- Name: psikolog psikolog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.psikolog
    ADD CONSTRAINT psikolog_pkey PRIMARY KEY (id);


--
-- Name: rekomendasi_langkah rekomendasi_langkah_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rekomendasi_langkah
    ADD CONSTRAINT rekomendasi_langkah_pkey PRIMARY KEY (id);


--
-- Name: ringkasan_refleksi ringkasan_refleksi_jurnal_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ringkasan_refleksi
    ADD CONSTRAINT ringkasan_refleksi_jurnal_id_key UNIQUE (jurnal_id);


--
-- Name: ringkasan_refleksi ringkasan_refleksi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ringkasan_refleksi
    ADD CONSTRAINT ringkasan_refleksi_pkey PRIMARY KEY (id);


--
-- Name: saran_balasan_cepat saran_balasan_cepat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saran_balasan_cepat
    ADD CONSTRAINT saran_balasan_cepat_pkey PRIMARY KEY (id);


--
-- Name: sesi_decision_support sesi_decision_support_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_decision_support
    ADD CONSTRAINT sesi_decision_support_pkey PRIMARY KEY (id);


--
-- Name: sesi_konsultasi sesi_konsultasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi
    ADD CONSTRAINT sesi_konsultasi_pkey PRIMARY KEY (id);


--
-- Name: sesi_login sesi_login_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_login
    ADD CONSTRAINT sesi_login_pkey PRIMARY KEY (id);


--
-- Name: sesi_pernapasan sesi_pernapasan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_pernapasan
    ADD CONSTRAINT sesi_pernapasan_pkey PRIMARY KEY (id);


--
-- Name: skala_mood skala_mood_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skala_mood
    ADD CONSTRAINT skala_mood_pkey PRIMARY KEY (id);


--
-- Name: slot_waktu slot_waktu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_waktu
    ADD CONSTRAINT slot_waktu_pkey PRIMARY KEY (id);


--
-- Name: spesialisasi spesialisasi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spesialisasi
    ADD CONSTRAINT spesialisasi_pkey PRIMARY KEY (id);


--
-- Name: status_pemutaran_musik status_pemutaran_musik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_pemutaran_musik
    ADD CONSTRAINT status_pemutaran_musik_pkey PRIMARY KEY (id);


--
-- Name: streak_harian streak_harian_akun_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streak_harian
    ADD CONSTRAINT streak_harian_akun_id_key UNIQUE (akun_id);


--
-- Name: streak_harian streak_harian_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streak_harian
    ADD CONSTRAINT streak_harian_pkey PRIMARY KEY (id);


--
-- Name: tarif_sesi tarif_sesi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarif_sesi
    ADD CONSTRAINT tarif_sesi_pkey PRIMARY KEY (id);


--
-- Name: ulasan ulasan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_pkey PRIMARY KEY (id);


--
-- Name: ulasan ulasan_sesi_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_sesi_id_key UNIQUE (sesi_id);


--
-- Name: catatan_hasil_sesi catatan_hasil_sesi_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_hasil_sesi
    ADD CONSTRAINT catatan_hasil_sesi_sesi_id_fkey FOREIGN KEY (sesi_id) REFERENCES public.sesi_konsultasi(id);


--
-- Name: catatan_mood catatan_mood_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_mood
    ADD CONSTRAINT catatan_mood_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: catatan_mood catatan_mood_label_emosi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_mood
    ADD CONSTRAINT catatan_mood_label_emosi_id_fkey FOREIGN KEY (label_emosi_id) REFERENCES public.label_emosi(id);


--
-- Name: catatan_mood catatan_mood_skala_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_mood
    ADD CONSTRAINT catatan_mood_skala_id_fkey FOREIGN KEY (skala_id) REFERENCES public.skala_mood(id);


--
-- Name: catatan_sesi catatan_sesi_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catatan_sesi
    ADD CONSTRAINT catatan_sesi_sesi_id_fkey FOREIGN KEY (sesi_id) REFERENCES public.sesi_konsultasi(id);


--
-- Name: draft_jurnal draft_jurnal_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.draft_jurnal
    ADD CONSTRAINT draft_jurnal_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: entri_jurnal entri_jurnal_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entri_jurnal
    ADD CONSTRAINT entri_jurnal_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: entri_jurnal entri_jurnal_prompt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entri_jurnal
    ADD CONSTRAINT entri_jurnal_prompt_id_fkey FOREIGN KEY (prompt_id) REFERENCES public.prompt_jurnal(id);


--
-- Name: file_data file_data_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.file_data
    ADD CONSTRAINT file_data_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: jadwal_praktik jadwal_praktik_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jadwal_praktik
    ADD CONSTRAINT jadwal_praktik_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: kunci_enkripsi kunci_enkripsi_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kunci_enkripsi
    ADD CONSTRAINT kunci_enkripsi_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: notifikasi notifikasi_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifikasi
    ADD CONSTRAINT notifikasi_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: notifikasi notifikasi_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifikasi
    ADD CONSTRAINT notifikasi_sesi_id_fkey FOREIGN KEY (sesi_id) REFERENCES public.sesi_konsultasi(id);


--
-- Name: opsi_pertimbangan opsi_pertimbangan_sesi_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opsi_pertimbangan
    ADD CONSTRAINT opsi_pertimbangan_sesi_decision_id_fkey FOREIGN KEY (sesi_decision_id) REFERENCES public.sesi_decision_support(id);


--
-- Name: pembayaran pembayaran_diskon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_diskon_id_fkey FOREIGN KEY (diskon_id) REFERENCES public.diskon_mahasiswa(id);


--
-- Name: pembayaran pembayaran_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_sesi_id_fkey FOREIGN KEY (sesi_id) REFERENCES public.sesi_konsultasi(id);


--
-- Name: pengaturan_privasi pengaturan_privasi_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengaturan_privasi
    ADD CONSTRAINT pengaturan_privasi_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: pengembalian_dana pengembalian_dana_pembayaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pengembalian_dana
    ADD CONSTRAINT pengembalian_dana_pembayaran_id_fkey FOREIGN KEY (pembayaran_id) REFERENCES public.pembayaran(id);


--
-- Name: percakapan_ai percakapan_ai_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.percakapan_ai
    ADD CONSTRAINT percakapan_ai_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: percakapan_ai percakapan_ai_mode_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.percakapan_ai
    ADD CONSTRAINT percakapan_ai_mode_chat_id_fkey FOREIGN KEY (mode_chat_id) REFERENCES public.mode_chat(id);


--
-- Name: pesan pesan_percakapan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pesan
    ADD CONSTRAINT pesan_percakapan_id_fkey FOREIGN KEY (percakapan_id) REFERENCES public.percakapan_ai(id);


--
-- Name: profil profil_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil
    ADD CONSTRAINT profil_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: profil_praktik profil_praktik_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profil_praktik
    ADD CONSTRAINT profil_praktik_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: psikolog psikolog_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.psikolog
    ADD CONSTRAINT psikolog_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: rekomendasi_langkah rekomendasi_langkah_sesi_decision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rekomendasi_langkah
    ADD CONSTRAINT rekomendasi_langkah_sesi_decision_id_fkey FOREIGN KEY (sesi_decision_id) REFERENCES public.sesi_decision_support(id);


--
-- Name: ringkasan_refleksi ringkasan_refleksi_jurnal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ringkasan_refleksi
    ADD CONSTRAINT ringkasan_refleksi_jurnal_id_fkey FOREIGN KEY (jurnal_id) REFERENCES public.entri_jurnal(id);


--
-- Name: saran_balasan_cepat saran_balasan_cepat_pesan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saran_balasan_cepat
    ADD CONSTRAINT saran_balasan_cepat_pesan_id_fkey FOREIGN KEY (pesan_id) REFERENCES public.pesan(id);


--
-- Name: sesi_decision_support sesi_decision_support_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_decision_support
    ADD CONSTRAINT sesi_decision_support_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: sesi_decision_support sesi_decision_support_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_decision_support
    ADD CONSTRAINT sesi_decision_support_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES public.kategori_keputusan(id);


--
-- Name: sesi_konsultasi sesi_konsultasi_pengguna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi
    ADD CONSTRAINT sesi_konsultasi_pengguna_id_fkey FOREIGN KEY (pengguna_id) REFERENCES public.akun_pengguna(id);


--
-- Name: sesi_konsultasi sesi_konsultasi_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi
    ADD CONSTRAINT sesi_konsultasi_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: sesi_konsultasi sesi_konsultasi_slot_waktu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi
    ADD CONSTRAINT sesi_konsultasi_slot_waktu_id_fkey FOREIGN KEY (slot_waktu_id) REFERENCES public.slot_waktu(id);


--
-- Name: sesi_konsultasi sesi_konsultasi_tarif_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_konsultasi
    ADD CONSTRAINT sesi_konsultasi_tarif_sesi_id_fkey FOREIGN KEY (tarif_sesi_id) REFERENCES public.tarif_sesi(id);


--
-- Name: sesi_login sesi_login_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_login
    ADD CONSTRAINT sesi_login_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: sesi_pernapasan sesi_pernapasan_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_pernapasan
    ADD CONSTRAINT sesi_pernapasan_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: sesi_pernapasan sesi_pernapasan_panduan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesi_pernapasan
    ADD CONSTRAINT sesi_pernapasan_panduan_id_fkey FOREIGN KEY (panduan_id) REFERENCES public.panduan_durasi_pernapasan(id);


--
-- Name: slot_waktu slot_waktu_ditahan_oleh_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_waktu
    ADD CONSTRAINT slot_waktu_ditahan_oleh_fkey FOREIGN KEY (ditahan_oleh) REFERENCES public.akun_pengguna(id);


--
-- Name: slot_waktu slot_waktu_jadwal_praktik_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_waktu
    ADD CONSTRAINT slot_waktu_jadwal_praktik_id_fkey FOREIGN KEY (jadwal_praktik_id) REFERENCES public.jadwal_praktik(id);


--
-- Name: spesialisasi spesialisasi_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spesialisasi
    ADD CONSTRAINT spesialisasi_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: status_pemutaran_musik status_pemutaran_musik_musik_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_pemutaran_musik
    ADD CONSTRAINT status_pemutaran_musik_musik_id_fkey FOREIGN KEY (musik_id) REFERENCES public.musik_relaksasi(id);


--
-- Name: status_pemutaran_musik status_pemutaran_musik_sesi_pernapasan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status_pemutaran_musik
    ADD CONSTRAINT status_pemutaran_musik_sesi_pernapasan_id_fkey FOREIGN KEY (sesi_pernapasan_id) REFERENCES public.sesi_pernapasan(id);


--
-- Name: streak_harian streak_harian_akun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streak_harian
    ADD CONSTRAINT streak_harian_akun_id_fkey FOREIGN KEY (akun_id) REFERENCES public.akun_pengguna(id);


--
-- Name: tarif_sesi tarif_sesi_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tarif_sesi
    ADD CONSTRAINT tarif_sesi_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: ulasan ulasan_pengguna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_pengguna_id_fkey FOREIGN KEY (pengguna_id) REFERENCES public.akun_pengguna(id);


--
-- Name: ulasan ulasan_psikolog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_psikolog_id_fkey FOREIGN KEY (psikolog_id) REFERENCES public.psikolog(id);


--
-- Name: ulasan ulasan_sesi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_sesi_id_fkey FOREIGN KEY (sesi_id) REFERENCES public.sesi_konsultasi(id);


--
-- PostgreSQL database dump complete
--

\unrestrict oWZIEhjCwDOroBMQfXlV0JfTE5OK9ncJLkr2Vgpb0NQjOc19zNj9t6mEWmH2Sdf

