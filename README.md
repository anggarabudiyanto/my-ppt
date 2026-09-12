# Template Presentasi LaTeX Beamer — Telkom University (AICOMS)

Template presentasi **modular** untuk seminar/promosi doktor maupun umum,
dikembangkan dari presentasi *"Analysis on Multiple Access Channel Based on
Quantum Entanglement"*. Seluruh kode dikomentari bahasa Indonesia agar
mudah dipelajari dan diubah siapa pun.

**Hasil kompilasi:** `main.pdf` (16:9, 22 halaman — termasuk slide panduan).

---

## 1. Struktur File

```
main.tex               ← FILE UTAMA: atur urutan slide di sini
konfigurasi.tex        ← DATA presentasi: judul, penulis, pembimbing, logo
ppt.sty                ← TEMA: warna, font, footer, kutipan, makro notasi
bib.bib                ← DAFTAR PUSTAKA (format BibTeX, berkomentar)

── SLIDE (satu file = satu bagian; urutan bebas) ──
01-sampul.tex          ← Slide judul (latar kampus + 3 logo)
02-outline.tex         ← Daftar isi otomatis dari semua \section
03-latar-belakang.tex  ← \section{LATAR BELAKANG}
04-pendahuluan.tex     ← \section{PENDAHULUAN}
05-quantum.tex         ← \section{QUANTUM}
06-entropi.tex         ← \section{ENTROPY}
07-negative-entropy.tex← \section{NEGATIVE ENTROPY}
08-kanal.tex           ← \section{CHANNEL}
09-referensi.tex       ← Daftar pustaka otomatis
10-penutup.tex         ← Slide "Thank You"

── PANDUAN & CONTOH ──
00-contoh-fitur.tex    ← 5 slide tutorial interaktif (teks, gambar, tabel,
                         notasi kuantum, kode, kutipan, blok)
KERANGKA-SLIDE.tex     ← Perpustakaan kerangka slide siap copy-paste
compile.sh             ← Skrip kompilasi 4 tahap

gambar/                ← Semua gambar (logo/, BASIC/, DIAGRAM/, lain-lain/)
```

## 2. Cara Kompilasi

### Otomatis
```bash
./compile.sh          # pdflatex → bibtex → pdflatex ×2
```

### Manual
```bash
pdflatex main.tex
bibtex   main
pdflatex main.tex
pdflatex main.tex     # 2× agar nomor gambar & daftar pustaka final
```

### Overleaf
1. Upload seluruh folder (atau zip → *New Project → Upload*).
2. Menu **Settings → Compiler**: pilih *pdfLaTeX*, **TeX Live version**:
   2019 atau lebih baru.
3. Kompilasi — Overleaf menjalankan bibtex otomatis.

## 3. Cara Mengubah (Alur Kerja Modular)

| Ingin mengubah…             | Edit file…                     |
|-----------------------------|--------------------------------|
| Judul / nama / pembimbing   | `konfigurasi.tex`              |
| Urutan / menambah slide     | `main.tex` (baris `\input`)    |
| Isi slide tertentu          | File `0N-*.tex` yang bersangkutan|
| Warna, font, footer, kutipan| `ppt.sty` (tiap bagian diberi nomor & komentar) |
| Daftar pustaka              | `bib.bib`                      |
| Slide baru dari nol         | Salin kerangka dari `KERANGKA-SLIDE.tex` |

**Menambah slide baru:** buat file mis. `09-contoh-slide-anda.tex`,
isikan kerangka dari `KERANGKA-SLIDE.tex`, lalu daftarkan di `main.tex`:
`\input{09-contoh-slide-anda}`.

**Menonaktifkan slide panduan** saat presentasi: beri tanda `%` pada
`\input{00-contoh-fitur}` di `main.tex`.

## 4. Cheat Sheet Penulisan

### Notasi kuantum (paket `braket` + makro `ppt.sty`)
| Tujuan                | Perintah                    | Hasil |
|-----------------------|-----------------------------|-------|
| Vektor keadaan        | `\ket{\psi}`                | \|ψ⟩  |
| Dual                  | `\bra{\psi}`                | ⟨ψ\|  |
| Proyektor             | `\ketbra{0}{1}`             | \|0⟩⟨1\| |
| Operator              | `\hat{U}\hat{U}^\dagger`    | ÛÛ†   |
| Trace                 | `\Tr(\rho)`                 | Tr(ρ) |
| Matriks               | `\begin{bmatrix}1\\0\end{bmatrix}` | [1;0] |
| Persamaan berlabel    | `\begin{equation}…\label{eq:a}\end{equation}` → rujuk `Persamaan~\ref{eq:a}` | (1) |

### Teks & struktur
- Ukuran font: `\tiny` < `\small` < `\normalsize`
- Rata kiri-kanan: `\justifying`
- Dua kolom: `\begin{columns}[T] … \begin{column}{0.5\textwidth}…`
- Nama perintah dalam teks: `\code{\frac{a}{b}}` (aman di mana saja)
- Blok: `block` (emas), `alertblock` (oranye), `exampleblock` (biru)

### Gambar, tabel, kode
```latex
\begin{figure}
  \centering
  \includegraphics[width=0.8\textwidth]{gambar/DIAGRAM/diagram2.png}
  \captionsetup{font=tiny, justification=justified}
  \captionof{figure}{Keterangan.}      % otomatis "Gambar <slide>.<no>."
  \label{fig:unik}                     % rujuk: Gambar~\ref{fig:unik}
\end{figure}
```
- Tabel: gunakan `booktabs` (`\toprule/\midrule/\bottomrule`).
- Kode: `\begin{lstlisting}[language=Python]…\end{lstlisting}` —
  **frame wajib diberi opsi `[fragile]`**.

### Kutipan pustaka (`bib.bib`)
- `\cite{kunci}` → nomor `[3]`
- `\firstcite{kunci}` → footnote lengkap (kutipan pertama)
- `\secondcite{kunci}` → footnote nomor (kutipan berikutnya)
- Panggil footnote/citasi di **level frame** (luar `columns`) agar tidak
  meluber keluar slide.

## 5. Perbaikan yang Sudah Dilakukan terhadap Versi Lama

1. **Footer 105%** → 100% (`.25+.47+.28`), tidak lagi bergeser keluar layar.
2. **`\thefigure` memakai `\arabic{chapter}`** — counter `chapter` tidak
   ada di beamer (sebab error); kini memakai nomor slide.
3. **Patch biblatex rapuh** (`\xapptobibmacro{cite}`) dihapus;
   `\firstcite/\secondcite` kini mandiri & stabil antar-versi.
4. **Salah notasi matematika diperbaiki:**
   - `tr B (\rho{AB})` → `\Tr_B(\rho_{AB})`; `\rho{A|B}` → `\rho_{A|B}`;
   - amplitudo Bell `1/2` → `1/\sqrt{2}` (ter-normalisasi);
   - `(\ket{00}+\ket{11}){AB}` → subskrip `_{AB}` yang benar;
   - `p_x Z\rho Z` → `p_z Z\rho Z` (salah indeks kanal Pauli);
   - `\bigotimes` antara matriks → `\otimes`, `I_A(1/2)` → `(1/2 I_A)`.
5. **Bibliografi:** `backend=biber` → `backend=bibtex` (berjalan di semua
   instalasi; entri `@article` yang tidak lengkap dirapikan).
6. **Caption tabel** kini berkap "Tabel" (sebelumnya semua "Gambar").
7. Tidak ada lagi *overfull box* yang terlihat (semua slide dicek visual).
8. Semua file diberi **komentar pengajaran** + `KERANGKA-SLIDE.tex`.

## 6. Kustomisasi Cepat

- **Warna tema:** ubah definisi `telu` (merah Telkom), `scisGold` (emas),
  `abu1/abu2/abu` di `ppt.sty` bagian [4].
- **Logo pojok:** `konfigurasi.tex` bagian 5.
- **Rasio 4:3:** hapus `aspectratio=169` di `main.tex` (posisi logo sampul
  perlu disesuaikan; kertas menjadi 12,8×9,6 cm).
- **Tanggal:** `\today` di `konfigurasi.tex` → tulis tanggal tetap bila perlu.

## 7. Lisensi & Kredit

- Tema diadaptasi dari *VT Presentation Template* & *THU Beamer Theme*.
- Konten contoh: Cerf & Adami (1997), *Negative entropy in quantum
  information theory* — dikutip pada slide terkait.
- Gambar milik Telkom University/AICOMS dan sumber yang dikutip;
  gunakan sesuai kebutuhan institusi Anda.
