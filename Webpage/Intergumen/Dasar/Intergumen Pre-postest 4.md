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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Intergumen Landing'>Intergumen</a> / Sesi 04</div>

# Sebelum belajar
**Intergumen 4** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Pretest (jangan nyontek) // POSTEst boleh nyontek dikit2
Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 5: Growth and Differentiation of the Epidermis**.

**Pilih satu jawaban yang paling tepat.**

1. Epidermis mengalami turnover dan menggantikan dirinya kira-kira setiap…  
A. 2 hari  
B. 2 minggu  
C. 2 bulan  
D. 2 tahun  
E. 20 tahun

2. Sel progenitor utama epidermis yang bertanggung jawab atas proliferasi dan self-renewal terletak di…  
A. Stratum korneum  
B. Lapisan basal  
C. Lapisan granular  
D. Dermis papilar  
E. Hipodermis

3. Sel yang sangat proliferatif tetapi berumur pendek dan hanya mengalami beberapa kali pembelahan disebut…  
A. Sel stem pluripoten  
B. Transit-amplifying cells  
C. Sel Merkel  
D. Melanosit  
E. Sel Langerhans

4. Penanda pada sel basal epidermis yang berkaitan dengan kapasitas self-renewal tinggi antara lain…  
A. β1 integrin, LRIG1, dan CD46  
B. Filaggrin, loricrin, dan involucrin  
C. K1, K10, dan Dsg1  
D. MITF, TYR, dan DCT  
E. CD3, CD4, dan CD8

5. Keratin yang paling sering menandai sel basal epidermis adalah…  
A. K1 dan K10  
B. K5 dan K14  
C. K6 dan K16  
D. K8 dan K18  
E. K9 dan K2

6. Perubahan utama saat sel basal berdiferensiasi menjadi sel spinosum adalah…  
A. Tetap mitotik dan mengekspresikan K5/K14  
B. Menjadi postmitotik dan mengekspresikan K1/K10  
C. Kehilangan desmosom seluruhnya  
D. Mengekspresikan filaggrin dan loricrin secara dominan  
E. Berubah menjadi melanosit

7. Pada diferensiasi epidermis, perubahan komposisi desmosom yang benar adalah…  
A. Dsg3 meningkat dan Dsg1 menurun  
B. Dsg3 menurun dan Dsg1 meningkat  
C. Dsg1 dan Dsg3 sama sekali tidak berubah  
D. Dsg3 hilang total sejak lapisan basal  
E. Dsg1 hanya terdapat pada sel basal

8. Gangguan pada Dsg3 seperti pada pemfigus vulgaris menyebabkan lepuh pada…  
A. Stratum korneum  
B. Antara sel basal dan lapisan spinosum pertama  
C. Hanya di lapisan granular  
D. Dermis profunda  
E. Hipodermis

9. Granula keratohialin pada sel granular terutama tersusun atas…  
A. Keratin, profilaggrin, dan loricrin  
B. Melanin dan tirosinase  
C. Kolagen tipe VII dan laminin  
D. Claudin dan okludin  
E. CD34 dan Factor XIIIa

10. Profilaggrin dimetabolisme menjadi asam amino, asam piroglutamat, dan asam urokanat yang berfungsi sebagai…  
A. Natural moisturizing factor untuk hidrasi dan proteksi UV  
B. Faktor transkripsi untuk K5/K14  
C. Reseptor untuk Notch  
D. Enzim transglutaminase  
E. Komponen utama desmosom

11. Tight junction pada epidermis terbentuk terutama di…  
A. Lapisan basal  
B. Lapisan spinosum  
C. Lapisan granular  
D. Stratum korneum  
E. Dermis papilar

12. Protein inti tight junction yang gangguannya dapat menyebabkan iktiosis neonatal pada manusia adalah…  
A. Claudin 1  
B. Filaggrin  
C. Loricrin  
D. Dsg1  
E. K10

13. Enzim yang berperan besar dalam crosslinking protein dan lipid untuk membentuk cornified envelope adalah…  
A. Tirosinase  
B. Transglutaminase  
C. DNMT1  
D. Caspase  
E. KIT

14. Faktor transkripsi yang merupakan commitment factor untuk transisi sel basal menjadi sel spinosum adalah…  
A. p63  
B. Notch  
C. MITF  
D. SOX10  
E. Prdm16

15. MiRNA yang diekspresikan di sel spinosum dan menekan p63 untuk memastikan diferensiasi yang tepat adalah…  
A. miR-203  
B. ANCR  
C. TINCR  
D. Hes1  
E. Klf4

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. B  
2. B  
3. B  
4. A  
5. B  
6. B  
7. B  
8. B  
9. A  
10. A  
11. C  
12. A  
13. B  
14. B  
15. A

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Intergumen 4'>Lanjut ke materi inti →</a>
  <div><a href='Intergumen Pre-postest 5'>Sesi berikutnya →</a> · <a href='Intergumen Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->