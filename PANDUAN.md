# 📗 PANDUAN LENGKAP — Template Presentasi Telkom University (LaTeX Beamer)

Selamat datang! Panduan ini menjelaskan **semua hal yang dibutuhkan** untuk
menggunakan, mengubah, dan mengembangkan template presentasi ini — dipenuhi
contoh kode, penjelasan notasi, dan daftar kesalahan umum beserta solusinya.

> **Prinsip template:** Anda cukup menyunting **dua jenis berkas**:
> 1. `konfigurasi.tex` → identitas (judul, nama, institusi, tanggal, logo);
> 2. berkas slide `0X-*.tex` → isi presentasi.
> Semua pengaturan rumit (warna, footer, logo, paket) sudah dibungkus di `ppt.sty`.

---

## Daftar Isi

1. [Persyaratan & Cara Mendapatkan PDF](#1-persyaratan--cara-mendapatkan-pdf)
2. [Struktur Berkas Proyek](#2-struktur-berkas-proyek)
3. [Mulai Cepat (3 Langkah)](#3-mulai-cepat-3-langkah)
4. [Mengedit Identitas Presentasi](#4-mengedit-identitas-presentasi)
5. [Menulis Konten Slide](#5-menulis-konten-slide)
   - 5.1 [Frame (slide) & Section (bab)](#51-frame-slide--section-bab)
   - 5.2 [Format Teks & Ukuran Font](#52-format-teks--ukuran-font)
   - 5.3 [Daftar: Bullet, Nomor, Panah](#53-daftar-bullet-nomor-panah)
   - 5.4 [Layout Dua Kolom](#54-layout-dua-kolom)
   - 5.5 [Blok Penyorotan](#55-blok-penyorotan)
   - 5.6 [Gambar](#56-gambar)
   - 5.7 [Tabel](#57-tabel)
   - 5.8 [Matematika](#58-matematika)
   - 5.9 [Notasi Kuantum (Ket–Bra / Dirac)](#59-notasi-kuantum-ketbra--dirac)
   - 5.10 [Kode Program](#510-kode-program)
   - 5.11 [Kutipan & Referensi](#511-kutipan--referensi)
   - 5.12 [Animasi Bertahap](#512-animasi-bertahap)
6. [Kartu Contoh Cepat (Cheat Sheet)](#6-kartu-contoh-cepat-cheat-sheet)
7. [Kesalahan Umum & Solusinya](#7-kesalahan-umum--solusinya)
8. [Konvensi Penulisan Kode & Komentar](#8-konvensi-penulisan-kode--komentar-proyek-ini)
9. [Kredit & Lisensi](#9-kredit--lisensi)

---

## 1. Persyaratan & Cara Mendapatkan PDF

Ada **tiga cara** — pilih salah satu:

### Cara A — Overleaf (paling mudah, tanpa instalasi)
1. Upload seluruh folder `template/` ke Overleaf (*New Project → Upload Project*,
   atau seret berkas-berkasnya).
2. Pastikan menu **Menu → Compiler = pdfLaTeX**, **TeX Live version = 2023 atau lebih baru**.
3. Tekan **Recompile** → PDF tampil. Selesai.

### Cara B — GitHub Actions (otomatis oleh server GitHub)
Setiap kali folder `template/` di-*push*, GitHub mengompilasi otomatis:
- buka tab **Actions** → pilih run terbaru → unduh artifact **Template-Presentasi-PDF**;
- pada branch `main`, hasil juga otomatis diletakkan di tab **Releases**
  (“PDF Terbaru”).

### Cara C — Komputer sendiri (TeX Live/TeX Studio)
```bash
# Linux (Debian/Ubuntu): pasang sekali
sudo apt-get install texlive-latex-base texlive-latex-recommended \
     texlive-latex-extra texlive-fonts-recommended texlive-bibtex-extra biber

# Kompilasi (dari dalam folder template/):
pdflatex main.tex      # putaran 1: menyusun struktur & daftar rujukan mentah
biber main             # memproses sitasi/daftar pustaka (bib.bib)
pdflatex main.tex      # putaran 2: memasukkan daftar pustaka
pdflatex main.tex      # putaran 3: menuntaskan nomor & rujukan silang
# Hasil: main.pdf   (atau cukup sekali perintah: latexmk -pdf main.tex)
```

---

## 2. Struktur Berkas Proyek

```
my-ppt/
├── template/                 ← SELURUH template yang Anda pakai
│   ├── main.tex              ← berkas utama (titik kompilasi & daftar slide)
│   ├── ppt.sty               ← gaya: warna, tema, footer, paket, makro bantu
│   ├── konfigurasi.tex       ← IDENTITAS: judul, penulis, institusi, logo
│   ├── 01-sampul.tex         ← slide judul (otomatis dari konfigurasi.tex)
│   ├── 02-outline.tex        ← daftar isi otomatis dari \section
│   ├── 03-contoh-konten.tex  ← KAMUS CONTOH semua fitur (boleh dihapus)
│   ├── 04-referensi.tex      ← daftar pustaka otomatis dari bib.bib
│   ├── 99-penutup.tex        ← slide "Terima Kasih"
│   ├── bib.bib               ← basis data referensi (BibTeX)
│   └── assets/               ← semua gambar
│       ├── logo/             ← logo institusi
│       └── diagram/          ← diagram/dokumentasi pendukung
├── _arsip-asli/              ← berkas lama versi asli (tidak dipakai template)
├── .github/workflows/        ← kompilasi PDF otomatis (GitHub Actions)
├── PANDUAN.md                ← panduan ini
└── README.md                 ← ringkasan repositori
```

**Alur** : `main.tex` memuat `ppt.sty` + `konfigurasi.tex`, lalu memuat
berkas slide satu per satu dengan `\input{...}`. Menonaktifkan sebuah berkas
slide = beri tanda `%` di baris `\input{...}`-nya pada `main.tex`.

---

## 3. Mulai Cepat (3 Langkah)

1. **Ganti identitas** — buka `konfigurasi.tex`, ganti judul, nama, institusi,
   tanggal, dan logo (semuanya diberi komentar penjelas).
2. **Tulis isi** — duplikat berkas `03-contoh-konten.tex` menjadi mis.
   `04-bab-saya.tex`, salin slide yang relevan, ganti teksnya, lalu daftarkan
   di `main.tex` dengan `\input{04-bab-saya}`.
3. **Kompilasi** — Overleaf: *Recompile*; lokal: perintah di bagian 1C.
   Referensi ditaruh di `bib.bib` dan dikutip dengan `\cite{kunci}`.

---

## 4. Mengedit Identitas Presentasi

Semua ada di `konfigurasi.tex`:

| Perintah        | Fungsi                                          | Versi `[singkat]` tampil di |
|-----------------|-------------------------------------------------|------------------------------|
| `\title[..]{..}`   | Judul lengkap (\\ = pindah baris)             | footer tengah                |
| `\author[..]{..}`  | Nama + NIM + pembimbing                       | footer kiri                  |
| `\institute{..}`   | Institusi + e-mail (halaman sampul)           | —                            |
| `\date[..]{..}`    | Tanggal/acara (`\today` = otomatis hari ini)  | footer kanan                 |
| `\logo{..}`        | Logo pojok kanan atas tiap slide              | —                            |

```latex
% Contoh:
\title[Judul Singkat Footer]{\textbf{Judul Lengkap\\Dua Baris}}
\author[Nama Anda]{\textbf{Nama Anda (1234567890)}}
\date[Sidang 2026]{Sidang Tugas Akhir \\ 11 September 2026}
```

---

## 5. Menulis Konten Slide

> Semua contoh di bawah ini **sudah ada, jalan, dan berkomentar** di
> `03-contoh-konten.tex` — buka berkas itu untuk versi lengkapnya.

### 5.1 Frame (slide) & Section (bab)

```latex
\section{Nama Bab}            % membuka bab: muncul di navigasi atas & outline
\begin{frame}                 % ── satu slide ──
  \frametitle{Judul Slide}    % judul slide
  Isi slide ditulis di sini.
\end{frame}                   % ── akhir slide ──
```

Aturan penting:
- **Satu gagasan per slide.** Slide penuh sesak = pecah menjadi dua frame.
- `\section{...}` ditulis **sebelum** frame pertama sebuah bab.
- Slide khusus (tanpa nomor): `\begin{frame}[noframenumbering]`.

### 5.2 Format Teks & Ukuran Font

| Tujuan                  | Perintah                        | Hasil                  |
|-------------------------|---------------------------------|------------------------|
| Tebal                   | `\textbf{teks}`                 | **teks**               |
| Miring / istilah asing  | `\emph{teks}` / `\istilah{...}` | *teks*                 |
| Font kode               | `\texttt{teks}`                 | `teks`                 |
| Garis bawah             | `\underline{teks}`              | teks bergaris          |
| Dicoret                 | `\sout{teks}`                   | teks dicoret           |
| Warna                   | `\textcolor{telu}{teks}`        | merah Telkom           |
| Sorot penting (makro)   | `\penekanan{teks}`              | **tebal + merah TELU** |
| Rata kiri-kanan         | `\begin{justify}...\end{justify}` atau `\justifying` | — |

Ukuran font **lokal** (bungkus dengan kurung kurawal agar tidak menular):
`{\tiny ...} < {\scriptsize ...} < {\footnotesize ...} < {\small ...} <
{\normalsize ...} < {\large ...} < {\Large ...}`.
Gunakan `\small`/`\footnotesize` bila slide padat; **hindari `\tiny`** untuk isi utama.

### 5.3 Daftar: Bullet, Nomor, Panah

```latex
\begin{itemize}                 % bullet
  \item butir tingkat satu
  \begin{itemize}               % bersarang = tingkat dua
    \item butir tingkat dua
  \end{itemize}
\end{itemize}

\begin{enumerate}               % bernomor otomatis
  \item langkah pertama
  \item langkah kedua
\end{enumerate}

\item[$\Rightarrow$]            % mengganti bullet menjadi panah
```

### 5.4 Layout Dua Kolom

```latex
\begin{columns}[T]                    % [T] = kolom rata atas
  \begin{column}{0.48\textwidth}      % kolom kiri 48% lebar slide
    isi kiri (teks/gambar/persamaan)
  \end{column}
  \hfill                              % jarak otomatis di tengah
  \begin{column}{0.48\textwidth}      % kolom kanan
    isi kanan
  \end{column}
\end{columns}
```

### 5.5 Blok Penyorotan

```latex
\begin{block}{Judul}          % emas   — poin utama/definisi
  isi
\end{block}
\begin{alertblock}{Judul}     % jingga — peringatan/kesalahan umum
  isi
\end{alertblock}
\begin{exampleblock}{Judul}   % biru   — contoh/studi kasus
  isi
\end{exampleblock}
```

### 5.6 Gambar

```latex
\begin{figure}
  \centering                                          % gambar di tengah
  \includegraphics[width=0.9\textwidth]{entanglement} % tanpa ekstensi pun boleh
  \caption{Keterangan gambar.}                        % bernomor OTOMATIS "Gambar N."
  \label{fig:entanglement}                            % nama acuan (unik!)
\end{figure}
```
- Letakkan berkas di `assets/` (atau subfoldernya) — path sudah didaftarkan di
  `\graphicspath`. **Nama berkas tanpa spasi** (pakai tanda hubung `-`).
- Rujuk di teks: `Gambar~\ref{fig:entanglement}` → “Gambar 1”.
- Format: `.png`, `.jpg`, `.pdf`. Atur lebar dengan `width=...`, atau
  `height=3cm, keepaspectratio`.

### 5.7 Tabel

```latex
\begin{table}
  \centering
  \caption{Judul tabel.}          % otomatis "Tabel N." — di ATAS tabel
  \label{tab:generasi}
  \small
  \begin{tabular}{lccl}           % l=kiri c=tengah r=kanan (1 huruf = 1 kolom)
    \toprule                      % garis atas (paket booktabs)
    Generasi & Teknologi & Kecepatan & Tahun \\
    \midrule                      % garis tengah (pemisah kepala-isi)
    2G & GSM & 9,6 kbps & 1991 \\
    5G & NR  & 10 Gbps  & 2019 \\
    \bottomrule                   % garis bawah
  \end{tabular}
\end{table}
```
`&` memisahkan sel, `\\` pindah baris. Rujuk: `Tabel~\ref{tab:generasi}`.

### 5.8 Matematika

| Kebutuhan                    | Cara menulis                                    |
|------------------------------|-------------------------------------------------|
| Dalam kalimat                | `\sel{S(\rho) = 1}` atau `$...$`                |
| Persamaan penting bernomor   | `\begin{equation} ... \label{eq:nama}\end{equation}` |
| Persamaan tanpa nomor        | `\begin{equation*} ... \end{equation*}` / `\[ ... \]` |
| Banyak baris selaras         | `\begin{align*} a &= b \\ c &= d \end{align*}` (`&` = titik selaras) |
| Kasus terpisah               | `\begin{cases} ... & ... \\ ... & ... \end{cases}` |
| Matriks                      | `\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}`  |
| Rujuk persamaan              | `\equ~\ref{eq:nama}` → “Persamaan 3”            |

Simbol yang sering dipakai: `\rho` ρ, `\phi` φ, `\theta` θ, `\psi` ψ,
`\dagger` †, `\sum_i` Σᵢ, `\frac{a}{b}`, `\tfrac{a}{b}` (kecil), `\sqrt{x}`,
`\log_2`, `\left( ... \right)` (kurung menyesuaikan isi), `\equiv` ≡, `\sim` ∼.
Operator nama tegak: gunakan `\tr` (trace, sudah didefinisikan) atau
`\operatorname{argmax}`. **Jangan** menulis nama fungsi italic biasa
(`tr`, `max` miring = salah tata tulis jurnal).

### 5.9 Notasi Kuantum (Ket–Bra / Dirac)

Perintah dari paket `braket` + makro `ppt.sty`:

| Perintah                      | Hasil      | Keterangan                    |
|-------------------------------|------------|-------------------------------|
| `\ket{0}`                     | \|0⟩       | vektor keadaan (ket)          |
| `\bra{0}`                     | ⟨0\|       | dual (bra)                    |
| `\ket{\psi}\bra{\psi}`        | \|ψ⟩⟨ψ\|   | operator proyeksi             |
| `\braket{0|1}`                | ⟨0\|1⟩     | hasil dalam-dalam             |
| `\ketsub{\psi}{AB}`           | \|ψ⟩\_AB   | ket dengan label sistem       |
| `\brasub{\psi}{AB}`           | ⟨ψ\|\_AB   | bra dengan label sistem       |
| `\hat{U}^{\dagger}`           | Û†         | transpose-konjugat            |
| `\tr_B(\rho_{AB})`            | tr\_B(ρ)   | partial trace                 |

⚠️ **Kesalahan paling sering — label sistem harus DI LUAR `\ket`:**

```latex
\ket{\psi}_{AB}    % ✅ BENAR  : |ψ⟩_AB  (subskrip menempel di luar ket)
\ket{\psi_{AB}}    % ❌ SALAH  : subskrip ikut DI DALAM ket → tipografi &
                   %            maknanya keliru (ψ bernama "psi_AB")
```

Contoh gabungan yang benar:

```latex
\begin{equation}
  \rho_{AB} = \ketsub{\psi}{AB}\brasub{\psi}{AB}, \qquad
  \rho_A = \tr_B(\rho_{AB}) \equiv \tfrac{1}{2} I_A
  \label{eq:density}
\end{equation}
```

### 5.10 Kode Program

```latex
% Bingkai kode dengan judul (disarankan):
\begin{pptcode}{Simulasi qubit (Python)}
import numpy as np
ket0 = np.array([1, 0])   # |0>
\end{pptcode}

% Tanpa judul, dengan pilihan bahasa:
\begin{lstlisting}[language=C++]
int main() { return 0; }
\end{lstlisting}

% Kode pendek di dalam kalimat:
% \lstinline|int x = 0;|
```
Warna sintaks, nomor baris, dan bingkai sudah diatur di `ppt.sty` (blok
“TAMPILAN KODE PROGRAM”). Bahasa didukung antara lain: Python, C, C++, Java,
MATLAB, R, HTML, SQL.

### 5.11 Kutipan & Referensi

1. Tambahkan entri di `bib.bib` (templat `@book`, `@article`,
   `@inproceedings`, `@online` tersedia di berkasnya, berkomentar).
2. Kutip di slide:

| Perintah              | Efek                                                  |
|-----------------------|-------------------------------------------------------|
| `\cite{kunci}`        | `[angka]` ringkas dalam teks                          |
| `\footcite{kunci}`    | footnote ringkas berisi nomor referensi               |
| `\firstcite{kunci}`   | footnote LENGKAP (entri penuh) — kutipan pertama      |
| `\secondcite{kunci}`  | footnote ringkas — untuk kutipan ulang                |

3. Slide **REFERENSI** (`04-referensi.tex`) mengisi otomatis.

```latex
Teori informasi kuantum \cite{barnett2009quantum} ...
kodetan Slepian--Wolf\firstcite{slepian1973noiseless} ...
kodetan yang sama\secondcite{slepian1973noiseless} ...
```

### 5.12 Animasi Bertahap

```latex
\begin{itemize}
  \item tampil sejak awal
  \pause                    % muncul setelah 1 klik
  \item muncul setelah klik
  \item<3-> muncul pada klik ke-3
\end{itemize}
```
Gunakan secukupnya — animasi membantu penyajian bertahap, bukan hiasan.

---

## 6. Kartu Contoh Cepat (Cheat Sheet)

| Saya ingin ...                | Tulis ...                                              |
|-------------------------------|--------------------------------------------------------|
| Slide baru                    | `\begin{frame} \frametitle{...} ... \end{frame}`       |
| Bab baru                      | `\section{Nama Bab}` sebelum frame pertama bab         |
| Slide tanpa nomor             | `\begin{frame}[noframenumbering]`                      |
| Dua kolom                     | lihat [5.4](#54-layout-dua-kolom)                      |
| Kotak penting                 | `\begin{block}{Judul}...\end{block}`                   |
| Gambar + nomor otomatis       | `figure` + `\includegraphics` + `\caption` + `\label`  |
| Tabel rapi                    | `table` + `tabular` + `\toprule/\midrule/\bottomrule`  |
| Rumus bernomor                | `equation` + `\label{eq:x}` ; rujuk `\equ~\ref{eq:x}`  |
| Ket dengan label sistem       | `\ketsub{\psi}{AB}`                                    |
| Kode program berjudul         | `\begin{pptcode}{Judul}...\end{pptcode}`               |
| Sitasi                        | `\cite{kunci}` / `\firstcite{kunci}`                   |
| Sorot kata                    | `\penekanan{penting}`                                  |
| Istilah asing                 | `\istilah{entanglement}`                               |
| Nonaktifkan berkas slide      | `% \input{04-bab-saya}` di `main.tex`                  |

---

## 7. Kesalahan Umum & Solusinya

| Gejala / Pesan Error                          | Penyebab & Solusi                                                     |
|-----------------------------------------------|-----------------------------------------------------------------------|
| `Overfull \hbox / \vbox` (teks keluar slide)  | Konten terlalu penuh → kecilkan font lokal (`{\small...}`), persingkat teks, pecah jadi 2 frame, atau kurangi lebar gambar. |
| `File ... not found`                          | Nama/path gambar salah. Pastikan berkas ada di `assets/`, tanpa spasi, dan nama ditulis persis (huruf besar-kecil berpengaruh di Linux/Overleaf). |
| `Missing $ inserted`                          | Simbol matematika (`_`, `^`, ρ, dll.) ditulis di luar mode matematika → bungkus dengan `\sel{...}` / `$...$`. |
| `Undefined control sequence \penekanan` dll.  | Makro dipakai tanpa `ppt.sty` dimuat → pastikan `\usepackage{ppt}` ada di `main.tex`. |
| `Reference ... undefined`                     | `\label` belum ada / `\ref` ditulis sebelum label; kompilasi **2 kali**. Pastikan label unik. |
| `Citation ... undefined` / pustaka kosong     | Lupa menjalankan `biber main` (lokal), atau kunci `\cite{...}` tidak ada di `bib.bib`. Di Overleaf cukup *Recompile* lagi. |
| `Required package `braket` not installed`-semacam error paket | Instal paket TeX yang hilang (lokal: `texlive-latex-extra` sudah mencakup semuanya) atau gunakan TeX Live 2023+ / Overleaf. |
| Slide melebihi tinggi → footer tertimpa       | Kurangi konten; geser dengan `\vspace{-0.3cm}` seperlunya; hindari `\tiny` berlebihan — pecah slide lebih baik. |
| Nomor gambar manual “Gambar 1”                | **Jangan** — pakai `\caption` + `\ref` agar nomor selalu benar.       |
| Subskrip di dalam `\ket{\psi_{AB}}`           | Salah notasi — tulis `\ket{\psi}_{AB}` / `\ketsub{\psi}{AB}` (lihat 5.9). |
| `enumitem` error dengan `\item<2->`           | Template sengaja tidak memakai `enumitem` karena bentrok dengan animasi beamer; gunakan itemize bawaan. |

**Aturan emas:** bila hasil kompilasi aneh, baca baris **error pertama** pada
log (Overleaf: ikon log) — error sesudahnya biasanya hanya efek berantai.

---

## 8. Konvensi Penulisan Kode & Komentar Proyek Ini

Supaya kode mudah dibaca siapa pun, semua berkas mengikuti pola berikut:

1. **Kepala berkas** — setiap berkas dibuka blok komentar yang menjelaskan
   fungsi berkas dan cara memakainya:
   ```latex
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %  NAMA-BERKAS.TEX — satu baris fungsi berkas
   %  -----------------------------------------------------------------------------
   %  Penjelasan lengkap, aturan pakai, dan hal yang perlu diketahui.
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   ```
2. **Pembatas blok** — bagian besar ditandai garis + judul agar mudah dinavigasi:
   ```latex
   %===============================================================================
   %  NAMA BLOK
   %===============================================================================
   ```
3. **Komentar satu baris** — `%  ` (persen + dua spasi) diikuti penjelasan
   singkat; komentar **di baris atas** kode yang dijelaskan, bukan setelahnya.
4. **Penamaan**:
   - label gambar `fig:nama`, tabel `tab:nama`, persamaan `eq:nama` — huruf
     kecil, tanda hubung;
   - kunci bib: `penulisTahunKataKunci` (contoh `barnett2009quantum`);
   - berkas gambar: tanpa spasi, tanda hubung (`slepian-wolf-plot.png`);
   - warna/makro baru di `ppt.sty`: kata lengkap tanpa singkatan rahasia
     (`emas`, `abuHijau`, `\penekanan`).
5. **Perubahan perilaku tampilan** (warna, footer) hanya di `ppt.sty`;
   **identitas** hanya di `konfigurasi.tex`; **konten** hanya di `0X-*.tex` —
   jangan mencampur antarberkas.

---

## 9. Kredit & Lisensi

- Template awal: inspirasi *VT Presentation Template* & *THU Beamer Theme*,
  dikembangkan untuk identitas **Telkom University – AICOMS** oleh
  **Anggara Budiyanto**.
- Rapian dokumentasi, perbaikan bug (notasi subskrip kuantum, `\tr`,
  normalisasi keadaan Bell, `p_z` kanal Pauli, kontras judul, penomoran
  gambar, duplikasi paket), dan penulisan ulang komentar: lihat riwayat commit.
- Kode template dilisensikan **MIT** (berkas `LICENSE`). Logo & foto kampus di
  `template/assets/` tetap milik pemiliknya — gunakan sesuai pedoman
  identitas institusi.

*Selamat menyusun presentasi — semoga sukses sidang/presentasinya! 🎓*
