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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Intergumen Landing'>Intergumen</a> / Sesi 06</div>

# Sebelum belajar
**Intergumen 6** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Pretest (jangan nyontek) // POSTEst boleh nyontek dikit2
Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 22: Atopic Dermatitis**.

**Pilih satu jawaban yang paling tepat.**

1. Prevalensi atopic dermatitis (AD) mencapai puncaknya sekitar…  
A. 1–2% pada usia lanjut  
B. 15–20% pada anak usia dini di negara industri  
C. 50% pada bayi baru lahir  
D. 3–7% pada anak usia sekolah  
E. 0,1% pada dewasa muda

2. Gejala utama (*hallmark*) atopic dermatitis adalah…  
A. Nyeri terbakar  
B. Pruritus  
C. Parestesia  
D. Alopesia  
E. Hiperpigmentasi tanpa gatal

3. Pola distribusi khas atopic dermatitis pada bayi adalah…  
A. Lipatan fleksural dan likenifikasi  
B. Wajah, kulit kepala, dan permukaan ekstensor ekstremitas  
C. Telapak tangan dan telapak kaki saja  
D. Area popok yang predominan  
E. Hanya area yang terpapar matahari

4. Pada anak yang lebih besar dan dewasa, atopic dermatitis kronis khas mengenai…  
A. Wajah dan ekstensor  
B. Lipatan fleksural dengan likenifikasi  
C. Telapak kaki dan kuku  
D. Kulit kepala posterior  
E. Area popok

5. Kriteria diagnostik utama atopic dermatitis yang masih menjadi standar emas adalah…  
A. Kriteria UK Working Party  
B. Kriteria Hanifin–Rajka  
C. Kriteria ISAAC  
D. Kriteria SCORAD  
E. Kriteria EASI

6. Mutasi *loss-of-function* gen yang paling konsisten menjadi faktor predisposisi utama AD pada populasi kulit putih Eropa dan Asia adalah…  
A. *FLG* (filaggrin)  
B. *KRT5*  
C. *COL7A1*  
D. *DSG3*  
E. *ABCC11*

7. Gen filaggrin terletak pada kromosom…  
A. 1q21  
B. 5q31–33  
C. 22q11.2  
D. Xp11  
E. 17q21

8. Sitokin yang berperan penting dalam inisiasi AD dan menginduksi sel dendritik untuk mengarahkan sel Th0 menjadi Th2 adalah…  
A. TSLP dan IL-33  
B. IFN-γ dan IL-12  
C. TNF-α dan IL-1β  
D. IL-17 dan IL-23  
E. TGF-β dan IL-10

9. Komplikasi infeksi yang paling sering ditemukan pada AD adalah infeksi superfisial oleh…  
A. *Staphylococcus aureus*  
B. *Streptococcus pyogenes*  
C. *Candida albicans*  
D. *Malassezia furfur*  
E. *Herpes simplex virus*

10. Eczema herpeticum ditandai oleh…  
A. Plak likenifikasi di lipatan fleksural  
B. Vesikel umbilikasi, erosi *punched-out*, dan nyeri hebat  
C. Krusta kuning madu tanpa vesikel  
D. Papul folikular tanpa gejala  
E. Hiperpigmentasi pasca-inflamasi saja

11. Gambaran histopatologi akut atopic dermatitis adalah…  
A. Spongiosis epidermis dengan infiltrat inflamasi meningkat  
B. Hiperkeratosis tanpa spongiosis  
C. Granuloma palisading  
D. Panniculitis septal  
E. Proliferasi sel basaloid

12. Pada lesi AD kronis, gambaran histopatologi yang khas adalah…  
A. Spongiosis minimal, epidermis hiperplastik dengan rete ridge memanjang, dan hiperkeratosis  
B. Spongiosis masif tanpa perubahan epidermis  
C. Nekrosis lemak subkutan  
D. Infiltrat neutrofilik dengan abses  
E. Deposisi amiloid di dermis

13. Terapi topikal yang menjadi dasar (*cornerstone*) terapi antiinflamasi pada AD adalah…  
A. Kortikosteroid topikal  
B. Antibiotik topikal rutin  
C. Antijamur topikal rutin  
D. Antiviral topikal rutin  
E. Retinoid topikal

14. Obat sistemik yang disetujui FDA untuk AD sedang–berat dan menargetkan subunit alfa reseptor IL-4 adalah…  
A. Dupilumab  
B. Omalizumab  
C. Siklosporin  
D. Metotreksat  
E. Azatioprin

15. Pernyataan yang benar mengenai terapi sistemik kortikosteroid pada AD kronis adalah…  
A. Merupakan terapi lini pertama jangka panjang  
B. Jarang diindikasikan dan dapat menyebabkan *rebound flare* setelah dihentikan  
C. Tidak pernah digunakan pada eksaserbasi akut  
D. Selalu diberikan tanpa tapering  
E. Tidak menimbulkan efek samping sistemik

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. B  
2. B  
3. B  
4. B  
5. B  
6. A  
7. A  
8. A  
9. A  
10. B  
11. A  
12. A  
13. A  
14. A  
15. B

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Intergumen 6'>Lanjut ke materi inti →</a>
  <div><a href='Intergumen Landing'>Kembali ke blok →</a> · <a href='Intergumen Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->