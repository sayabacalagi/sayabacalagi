<!-- SJAWATDH-HEAD:BEGIN -->
<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,400&family=IBM+Plex+Mono:wght@400;500&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;1,6..72,400&display=swap');

:root {
  --bg-paper: #FAF7F2;
  --surface: #FFFFFF;
  --surface-subtle: #F3EDE2;
  --ink: #1C1917;
  --ink-soft: #57534E;
  --ink-muted: #78716C;
  --accent: #7C2D12;
  --line: #E7E0D5;
}

aside, nav[aria-label='Table of contents'], .toc, [class*='toc'], [class*='backlinks'], [class*='footer'] { display: none !important; }

body, main {
  background-color: var(--bg-paper) !important;
  color: var(--ink) !important;
  font-family: 'DM Sans', -apple-system, BlinkMacSystemFont, sans-serif !important;
}

article, .prose, main > div {
  max-width: 760px !important;
  margin-left: auto !important;
  margin-right: auto !important;
  line-height: 1.75 !important;
  font-size: 1.02rem !important;
}

article h1, article h2, article h3, .prose h1, .prose h2, .prose h3 {
  font-family: 'Newsreader', Georgia, serif !important;
  font-weight: 500 !important;
  color: var(--ink) !important;
  letter-spacing: -0.015em !important;
}

article h2, .prose h2 {
  margin-top: 2.35rem !important;
  padding-bottom: 0.35rem;
  border-bottom: 1px solid var(--line);
  font-size: 1.42rem !important;
}

article blockquote, .prose blockquote {
  background: var(--surface) !important;
  border-left: 3px solid var(--accent) !important;
  padding: 0.75rem 1rem !important;
  border-radius: 0 8px 8px 0;
  color: var(--ink-soft) !important;
  font-size: 0.94rem !important;
}

.sj-wrap {
  max-width: 880px;
  margin: 0 auto;
  padding: 1.25rem 1rem 3.5rem;
}

.sj-nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 1.05rem;
  border-bottom: 1px solid var(--line);
  margin-bottom: 2.5rem;
}

.sj-logo {
  font-family: 'Newsreader', Georgia, serif;
  font-size: 1.4rem;
  font-weight: 500;
  color: var(--ink) !important;
  text-decoration: none !important;
}

.sj-nav-right {
  display: flex;
  gap: 1.4rem;
  font-size: 0.9rem;
}

.sj-nav-right a {
  color: var(--ink-soft) !important;
  text-decoration: none !important;
}

.sj-nav-right a:hover {
  color: var(--accent) !important;
}

.sj-crumb {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--ink-muted);
  margin-bottom: 0.75rem;
}

.sj-crumb a {
  color: var(--ink-soft) !important;
  text-decoration: none !important;
}

.sj-crumb a:hover {
  color: var(--accent) !important;
}

.sj-hero {
  display: grid;
  grid-template-columns: 1.5fr 1fr;
  gap: 2.5rem;
  align-items: end;
  margin-bottom: 3.5rem;
}

@media (max-width: 720px) {
  .sj-hero {
    grid-template-columns: 1fr;
    gap: 1.75rem;
  }
}

.sj-h1 {
  font-family: 'Newsreader', Georgia, serif !important;
  font-size: clamp(2.15rem, 4.4vw, 3.1rem) !important;
  line-height: 1.12 !important;
  font-weight: 400 !important;
  letter-spacing: -0.02em !important;
  color: var(--ink) !important;
  margin: 0 0 0.85rem 0 !important;
  border: none !important;
}

.sj-lead {
  font-size: 1.04rem;
  line-height: 1.55;
  color: var(--ink-soft);
  margin: 0 0 1.4rem 0;
  max-width: 44ch;
}

.sj-btn {
  display: inline-block;
  font-size: 0.92rem;
  font-weight: 500;
  color: var(--ink) !important;
  border-bottom: 1.5px solid var(--ink);
  padding-bottom: 0.2rem;
  text-decoration: none !important;
  transition: color 0.15s ease, border-color 0.15s ease;
}

.sj-btn:hover {
  color: var(--accent) !important;
  border-color: var(--accent);
}

.sj-broty-note {
  display: flex;
  align-items: center;
  gap: 0.9rem;
  padding: 0.95rem 1.1rem;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 10px;
}

.sj-broty-copy {
  font-size: 0.88rem;
  line-height: 1.45;
  color: var(--ink-soft);
  margin: 0;
}

.sj-broty-copy strong {
  color: var(--ink);
  font-weight: 500;
}

.sj-index-head {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  margin-bottom: 0.75rem;
}

.sj-h2 {
  font-family: 'Newsreader', Georgia, serif !important;
  font-size: 1.45rem !important;
  font-weight: 400 !important;
  margin: 0 !important;
  border: none !important;
}

.sj-mono {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--ink-muted);
}

.sj-index-list {
  border-top: 1px solid var(--line);
  margin-bottom: 3rem;
}

.sj-index-row {
  display: grid;
  grid-template-columns: 3.2rem 1fr auto auto;
  align-items: center;
  gap: 1rem;
  padding: 1.05rem 0.4rem;
  border-bottom: 1px solid var(--line);
  text-decoration: none !important;
  color: inherit !important;
  transition: background-color 0.15s ease, padding-left 0.15s ease;
}

.sj-index-row:hover {
  background-color: var(--surface-subtle);
  padding-left: 0.85rem;
}

.sj-row-num {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.82rem;
  font-weight: 500;
}

.sj-row-title {
  font-family: 'Newsreader', Georgia, serif;
  font-size: 1.25rem;
  color: var(--ink);
}

.sj-row-meta {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--ink-muted);
}

.sj-row-arrow {
  font-size: 0.95rem;
  color: var(--ink-muted);
  transition: transform 0.15s ease, color 0.15s ease;
}

.sj-index-row:hover .sj-row-arrow {
  transform: translateX(3px);
  color: var(--accent);
}

.sj-stepper {
  margin-top: 3rem;
  padding-top: 1.25rem;
  border-top: 1px solid var(--line);
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 0.75rem;
  font-size: 0.9rem;
}

.sj-stepper a {
  color: var(--accent) !important;
  font-weight: 500;
  text-decoration: none !important;
}

.sj-stepper a:hover {
  text-decoration: underline !important;
}

.sj-spoiler {
  margin-top: 2rem;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 10px;
  padding: 0.85rem 1.15rem;
}

.sj-spoiler summary {
  cursor: pointer;
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.84rem;
  color: var(--accent);
  font-weight: 500;
  list-style: none;
}

.sj-spoiler[open] summary {
  margin-bottom: 1rem;
  padding-bottom: 0.65rem;
  border-bottom: 1px solid var(--line);
}

.sj-foot {
  border-top: 1px solid var(--line);
  padding-top: 1.25rem;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 0.75rem;
  font-size: 0.84rem;
  color: var(--ink-muted);
}

.sj-foot a {
  color: var(--ink-soft) !important;
  text-decoration: none !important;
}

.sj-foot a:hover {
  color: var(--accent) !important;
}
</style>

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Intergumen Landing'>Intergumen</a> / Sesi 01</div>

# Sebelum belajar
**Intergumen 1** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Pretest (jangan nyontek) // POSTEst boleh nyontek dikit2
Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan Bab 1 *Foundations of Clinical Dermatology*.

**Pilih satu jawaban yang paling tepat.**

1. Tujuan utama anamnesis pada pasien dengan keluhan kulit baru adalah…  
A. Menentukan diagnosis  
B. Menilai kandidat terapi  
C. Mendokumentasikan lesi  
D. Menentukan prognosis  
E. Menilai kebutuhan biopsi  

2. Area yang sering terlewat tetapi harus diperiksa dalam pemeriksaan kulit lengkap adalah…  
A. Lengan dan tungkai  
B. Dada dan punggung  
C. Wajah dan leher  
D. Kulit kepala, kelopak mata, telinga, genital, bokong, perineum, dan sela jari  
E. Hanya area yang dikeluhkan pasien  

3. Kondisi ideal untuk pemeriksaan kulit lengkap adalah…  
A. Cahaya redup dan pasien tetap berpakaian  
B. Cahaya alami terang dan pasien dibuka pakaiannya serta memakai gown  
C. Cahaya lampu kuning dan pasien hanya membuka area lesi  
D. Ruangan gelap untuk melihat fluoresensi  
E. Tanpa perlu melepas kacamata atau make-up  

4. Lampu Wood yang direkomendasikan untuk membantu menilai perubahan pigmen memiliki panjang gelombang…  
A. 365 nm  
B. 450 nm  
C. 532 nm  
D. 600 nm  
E. 780 nm  

5. Morfologi primer menggambarkan tiga karakteristik lesi, yaitu…  
A. Warna, tekstur, dan distribusi  
B. Ukuran, topografi, dan isi lesi  
C. Bentuk, konfigurasi, dan warna  
D. Lokasi, simetri, dan gejala  
E. Skala, krusta, dan erosi  

6. Lesi datar, tidak teraba, hanya berupa perubahan warna, dan berukuran <1 cm disebut…  
A. Patch  
B. Papula  
C. Makula  
D. Plak  
E. Nodul  

7. Plak adalah…  
A. Lesi datar ≥1 cm  
B. Lesi teraba <1 cm  
C. Elevasi plateau solid dengan diameter ≥1 cm  
D. Lesi berisi cairan <1 cm  
E. Lesi berisi pus <1 cm  

8. Perbedaan vesikel dan bula yang benar adalah…  
A. Vesikel ≥1 cm; bula <1 cm  
B. Vesikel <1 cm; bula ≥1 cm  
C. Vesikel berisi pus; bula berisi serum  
D. Vesikel selalu teraba; bula tidak teraba  
E. Vesikel hanya di epidermis; bula hanya di subkutis  

9. Pustula adalah…  
A. Lesi datar berwarna merah  
B. Papula sirkumskrip yang terangkat dan mengandung pus yang terlihat  
C. Lesi berisi serum <1 cm  
D. Penebalan garis kulit akibat garukan  
E. Kehilangan kontinuitas kulit berbentuk linier  

10. Pernyataan yang benar mengenai skala dan krusta adalah…  
A. Skala menunjukkan perubahan epidermis; krusta adalah cairan kering di permukaan kulit  
B. Skala adalah cairan kering; krusta adalah penebalan stratum korneum  
C. Skala selalu berisi pus; krusta selalu berisi darah  
D. Skala menunjukkan proses dermis; krusta menunjukkan proses subkutis  
E. Skala dan krusta tidak dapat dibedakan secara klinis  

11. Likenifikasi adalah…  
A. Penipisan epidermis dengan tampilan seperti kertas rokok  
B. Penebalan dan aksentuasi garis kulit akibat gesekan atau garukan berulang  
C. Kehilangan kontinuitas kulit akibat tegangan  
D. Lesi teraba >1 cm  
E. Perubahan warna akibat melanin di dermis  

12. Melanin di dermis dapat tampak abu-abu atau biru karena…  
A. Efek Tyndall  
B. Efek Koebner  
C. Fenomena Auspitz  
D. Tanda Nikolsky  
E. Tanda Darier  

13. Lesi targetoid memiliki ciri…  
A. Bagian tengah lebih pucat daripada tepi  
B. Bagian tengah lebih gelap daripada tepi  
C. Berbentuk seperti garis lurus  
D. Berbentuk jaring-jaring  
E. Berbentuk seperti ular  

14. Distribusi dermatomal/zosteriform berarti…  
A. Lesi bilateral simetris  
B. Lesi pada area yang terpapar matahari  
C. Lesi unilateral mengikuti distribusi satu akar saraf aferen spinal  
D. Lesi pada lipatan kulit  
E. Lesi tersebar jarang dan tidak teratur  

15. Tanda Nikolsky positif paling relevan pada…  
A. Psoriasis dan liken planus  
B. Pemfigus vulgaris dan nekrolisis epidermal toksik  
C. Dermatofibroma dan neurofibroma  
D. Urtikaria dan dermatitis atopik  
E. Tinea korporis dan tinea versikolor

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. A  
2. D  
3. B  
4. A  
5. B  
6. C  
7. C  
8. B  
9. B  
10. A  
11. B  
12. A  
13. B  
14. C  
15. B

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Intergumen 1'>Lanjut ke materi inti →</a>
  <div><a href='Intergumen Pre-postest 2'>Sesi berikutnya →</a> · <a href='Intergumen Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->