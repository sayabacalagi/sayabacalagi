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
  --accent: #9A3412;
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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Endokrin Landing'>Endokrin</a> / Sesi 01</div>

# Sebelum belajar
**Approach to the Patient with Endocrine Disorders** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan bab **Approach to the Patient with Endocrine Disorders**.

**Pilih satu jawaban yang paling tepat.**

1. Endokrinologi **tidak dapat didefinisikan secara ketat berdasarkan garis anatomis** karena…  
A. Hormon hanya dihasilkan oleh kelenjar klasik  
B. Banyak organ nonendokrin menghasilkan hormon dan berinteraksi dengan sistem endokrin  
C. Hormon tidak memiliki fungsi fisiologis  
D. Endokrinologi hanya mempelajari diabetes melitus  
E. Semua hormon bekerja secara autokrin saja

2. Tiga kelompok utama penyakit endokrin adalah…  
A. Hiperfungsi, hipofungsi, dan resistensi hormon  
B. Infeksi, tumor, dan trauma  
C. Obesitas, diabetes, dan hipertensi  
D. Genetik, lingkungan, dan nutrisi  
E. Akut, subakut, dan kronis

3. Sindrom **MEN1** terutama ditandai oleh triad tumor pada…  
A. Paratiroid, pulau pankreas, dan hipofisis  
B. Tiroid meduler, feokromositoma, dan paratiroid  
C. Adrenal, ovarium, dan testis  
D. Hipofisis, tiroid, dan adrenal  
E. Paratiroid, tiroid, dan ovarium

4. Gen **MEN1** terletak pada kromosom…  
A. 11q13  
B. 22q11.2  
C. 7q31  
D. 17p13  
E. Xq28

5. **MEN2** disebabkan oleh mutasi aktivasi pada…  
A. *RET* protoonkogen  
B. *MEN1* gen supresor tumor  
C. Reseptor androgen  
D. *Gs α*  
E. Reseptor TSH

6. Penyakit Graves disebabkan oleh…  
A. Autoantibodi yang berikatan dengan reseptor TSH dan meniru aksi TSH  
B. Mutasi inaktivasi reseptor TSH  
C. Defisiensi yodium  
D. Destruksi autoimun sel β pankreas  
E. Mutasi gen *RET*

7. Mutasi aktivasi reseptor **LH** menyebabkan…  
A. Pubertas prekoks terbatas pada laki-laki  
B. Sindrom Turner  
C. Resistensi androgen lengkap  
D. Hipotiroidisme kongenital  
E. Diabetes tipe 1

8. Resistensi androgen lengkap pada individu dengan kariotipe XY ditandai oleh…  
A. Fenotip perempuan meskipun kadar LH dan testosteron meningkat  
B. Fenotip laki-laki dengan testosteron rendah  
C. Kadar LH dan testosteron rendah  
D. Hiperplasia adrenal kongenital  
E. Defisiensi 21-hidroksilase

9. Imunoassay hormone yang menggunakan dua antibodi berbeda bertujuan untuk…  
A. Meningkatkan afinitas dan spesifisitas ikatan  
B. Menurunkan sensitivitas  
C. Mengukur hanya metabolit urin  
D. Menghindari penggunaan antibodi  
E. Menggantikan semua uji dinamik

10. Pemeriksaan **urine-free cortisol 24 jam** terutama mencerminkan…  
A. Jumlah kortisol tidak terikat yang tersedia secara biologis  
B. Kortisol total serum  
C. Kadar ACTH hipofisis  
D. Kadar aldosteron  
E. Kadar renin

11. Pada pasien dengan kadar testosteron rendah dan LH tinggi, kelainan yang paling mungkin adalah…  
A. Gangguan primer pada gonad  
B. Gangguan hipotalamus-hipofisis  
C. Resistensi androgen  
D. Hiperprolaktinemia  
E. Defisiensi enzim adrenal

12. Pada evaluasi fungsi tiroid, pemeriksaan lini pertama yang paling sensitif adalah…  
A. TSH  
B. T3 total  
C. Tiroglobulin  
D. Kalsitonin  
E. TRH

13. Kombinasi kalsium serum tinggi dan PTH meningkat paling mendukung diagnosis…  
A. Hiperparatiroidisme  
B. Hiperkalsemia akibat malignansi  
C. Penyakit granulomatosa  
D. Hipoparatiroidisme  
E. Defisiensi vitamin D

14. Pada keadaan hiperkortisolemia, kadar ACTH yang **tertekan** paling menunjukkan…  
A. Adenoma adrenal yang berfungsi  
B. Penyakit Cushing hipofisis  
C. Sekresi ACTH ektopik  
D. Insufisiensi adrenal primer  
E. Sindrom Sheehan

15. Uji **ACTH stimulation test** terutama digunakan untuk menilai…  
A. Respons adrenal pada dugaan insufisiensi adrenal  
B. Hiperfungsi adrenal pada Cushing  
C. Cadangan hipofisis  
D. Kadar hormon tiroid  
E. Fungsi ovarium

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. B  
2. A  
3. A  
4. A  
5. A  
6. A  
7. A  
8. A  
9. A  
10. A  
11. A  
12. A  
13. A  
14. A  
15. A

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Endokrin 1'>Lanjut ke materi inti →</a>
  <div><a href='Endokrin Pre-postest 2'>Sesi berikutnya →</a> · <a href='Endokrin Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->