# Template Presentasi Telkom University – AICOMS (LaTeX Beamer) 🎓

Template presentasi **LaTeX Beamer 16:9** dengan identitas Telkom
University/AICOMS — dirapikan, didokumentasikan penuh (komentar Bahasa
Indonesia), dan dilengkapi *kamus contoh* agar **siap dipakai siapa saja**,
tanpa perlu pengalaman LaTeX yang mendalam.

## ✨ Fitur

- 🎨 Tema warna Telkom (merah `telu` + emas) dengan footer 3 bagian
  *(nama | judul | tanggal + nomor slide)* dan navigasi bab otomatis.
- 🧭 **Struktur jelas**: satu berkas identitas (`konfigurasi.tex`), satu berkas
  gaya (`ppt.sty`), berkas slide terpisah per bab.
- 📚 **Kamus contoh** (`03-contoh-konten.tex`): teks, daftar, kolom, blok,
  gambar, tabel, matematika, **notasi kuantum (ket–bra)**, kode program,
  kutipan referensi, dan animasi — semua berkomentar lengkap.
- 🐛 **Perbaikan bug** dari versi lama: penulisan subskrip kuantum
  (`\ket{\psi}_{AB}`), `\operatorname{tr}`, normalisasi keadaan Bell (`1/√2`),
  `p_z` pada kanal Pauli, kontras judul slide, penomoran gambar duplikat,
  paket dobel, dan lain-lain (detail di `PANDUAN.md`).
- 🤖 **Kompilasi PDF otomatis** oleh GitHub Actions: PDF terbaru selalu
  tersedia di tab *Actions* (artifact) dan tab *Releases*.

## 🚀 Mulai Cepat

1. Buka folder `template/` di [Overleaf](https://www.overleaf.com) (compiler
   **pdfLaTeX**, TeX Live 2023+) atau kompile lokal dengan TeX Live.
2. Sunting `konfigurasi.tex` (judul, nama, institusi, tanggal, logo).
3. Salin contoh slide dari `03-contoh-konten.tex`, ganti isinya, tekan
   *Recompile* — selesai!

📖 **Panduan lengkap (Bahasa Indonesia): [`PANDUAN.md`](PANDUAN.md)** —
berisi cara kompilasi, contoh semua perintah & notasi, *cheat sheet*, dan
tabel kesalahan umum + solusi.

## 📁 Struktur

```
template/          ← paket template yang Anda pakai (main.tex = titik kompilasi)
template/assets/   ← logo, gambar, diagram (nama berkas tanpa spasi)
_arsip-asli/       ← berkas sumber versi lama (arsip, tidak dipakai template)
.github/workflows/ ← kompilasi PDF otomatis tiap push
```

## 📄 PDF Hasil Kompilasi

- Tab **Actions** → run terbaru → *Artifacts* → `Template-Presentasi-PDF`.
- Branch `main`: tab **Releases** → rilis *“PDF Terbaru”*.

## 📜 Lisensi

Kode template: MIT (lihat `LICENSE`). Logo & foto kampus pada
`template/assets/` milik pemiliknya masing-masing (Telkom University/AICOMS).
