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
  --accent: #B91C1C;
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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Kardiovaskular Landing'>Kardiovaskular</a> / Sesi 02</div>

# Sebelum belajar
**Kardiovaskular 2** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 235: Electrocardiography**.

**Pilih satu jawaban yang paling tepat.**

1. Gelombang P pada elektrokardiogram (EKG) menggambarkan…  
A. Depolarisasi ventrikel  
B. Repolarisasi ventrikel  
C. Depolarisasi atrium  
D. Repolarisasi atrium yang selalu terlihat jelas  
E. Periode isoelektrik ventrikel

2. Kompleks QRS menggambarkan…  
A. Depolarisasi atrium  
B. Depolarisasi ventrikel  
C. Repolarisasi ventrikel  
D. Repolarisasi atrium  
E. Fase plateau atrium

3. Interval PR normal adalah…  
A. 40–80 ms  
B. 80–100 ms  
C. 120–200 ms  
D. 200–300 ms  
E. >300 ms

4. Pada kecepatan rekaman 25 mm/s, kotak kecil 1 mm secara horizontal setara dengan…  
A. 0,01 s  
B. 0,02 s  
C. 0,04 s  
D. 0,10 s  
E. 0,20 s

5. Cara cepat menghitung laju jantung dari interval RR adalah membagi…  
A. 1500 dengan jumlah kotak kecil antar-R  
B. 300 dengan jumlah kotak kecil antar-R  
C. 100 dengan jumlah kotak besar antar-R  
D. 600 dengan jumlah kotak besar antar-R  
E. 1500 dengan jumlah kotak besar antar-R

6. Sadapan ekstremitas merekam potensial pada bidang…  
A. Horizontal  
B. Frontal  
C. Sagital  
D. Oblik  
E. Transversal murni

7. Vektor depolarisasi atrium normal berorientasi ke bawah dan ke kiri, sehingga gelombang P normal…  
A. Positif di lead II dan negatif di aVR  
B. Negatif di lead II dan positif di aVR  
C. Selalu bifasik di lead II  
D. Selalu negatif di lead I  
E. Tidak terlihat di lead II

8. Depolarisasi septum ventrikel normal berlangsung dari…  
A. Kanan ke kiri dan posterior  
B. Kiri ke kanan dan anterior  
C. Epikardium ke endokardium  
D. Apex ke basis  
E. Posterior ke anterior

9. Zona transisi pada sadapan prekordial normal biasanya terdapat pada…  
A. V1 atau V2  
B. V3 atau V4  
C. V5 atau V6  
D. aVR  
E. Lead III

10. Deviasi aksis kiri didefinisikan sebagai aksis QRS yang lebih negatif dari…  
A. 0°  
B. –30°  
C. +30°  
D. +90°  
E. +120°

11. Gelombang U yang sangat menonjol paling sering berkaitan dengan…  
A. Obat seperti amiodarone/sotalol atau hipokalemia  
B. Hiperkalemia berat  
C. Hiperkalsemia  
D. Digoxin  
E. Perikarditis akut

12. Pada right bundle branch block (RBBB) lengkap, gambaran khas di lead V1 adalah…  
A. QS kompleks  
B. rSR′  
C. Gelombang P bifasik  
D. ST elevasi difus  
E. Gelombang U menonjol

13. Pada left bundle branch block (LBBB), gambaran khas di lead V1 dan V6 adalah…  
A. rSR′ di V1 dan qRS di V6  
B. Kompleks QS di V1 dan kompleks R lebar di V6  
C. Gelombang q septum normal di V6  
D. ST depresi hanya di V1  
E. Gelombang P negatif di II

14. Iskemia subendokardial akut pada sadapan yang menghadap area iskemik biasanya menghasilkan…  
A. ST elevasi  
B. ST depresi  
C. Gelombang Q patologis  
D. Gelombang U negatif  
E. P pulmonale

15. Perubahan EKG paling awal pada hiperkalemia biasanya berupa…  
A. Gelombang U menonjol  
B. Gelombang T memuncak (“tenting”)  
C. QT memendek  
D. Gelombang P tinggi  
E. ST elevasi difus

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. C  
2. B  
3. C  
4. C  
5. A  
6. B  
7. A  
8. B  
9. B  
10. B  
11. A  
12. B  
13. B  
14. B  
15. B

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Kardiovaskular 2'>Lanjut ke materi inti →</a>
  <div><a href='Kardiovaskular Landing'>Kembali ke blok →</a> · <a href='Kardiovaskular Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->