#!/usr/bin/env bash
#=====================================================================
#  COMPILE.SH — SKRIP KOMPILASI PRESENTASI
#=====================================================================
#  Kompilasi LaTeX yang benar untuk presentasi ber-bibliografi
#  membutuhkan 4 tahap (pdflatex -> bibtex -> pdflatex x2).
#  Jalankan:  chmod +x compile.sh && ./compile.sh
#=====================================================================
set -e   # berhenti jika ada error

pdflatex -interaction=nonstopmode main.tex
bibtex   main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

echo "----------------------------------------------------------"
echo " Selesai! Hasil: main.pdf"
echo "----------------------------------------------------------"
