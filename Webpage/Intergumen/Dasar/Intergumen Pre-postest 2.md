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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Intergumen Landing'>Intergumen</a> / Sesi 02</div>

# Sebelum belajar
**Intergumen 2** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Pretest (jangan nyontek) // POSTEst boleh nyontek dikit2
Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 2: Pathology of Skin Lesions**.

**Pilih satu jawaban yang paling tepat.**

1. Biopsi jenis *shave* paling sesuai untuk lesi yang proses patologinya terutama berada di…  
A. Subkutis  
B. Dermis retikularis profunda  
C. Epidermis atau dermis superfisial  
D. Fasia  
E. Otot

2. Untuk sebagian besar dermatosis inflamasi, jenis biopsi yang memberikan hasil terbaik adalah…  
A. *Shave*  
B. *Punch*  
C. *Curettage*  
D. Eksisi luas  
E. Biopsi jaring

3. Pada alopecia, dua biopsi *punch* 4 mm dianjurkan karena…  
A. Satu untuk kultur, satu untuk DIF  
B. Satu untuk potongan horizontal, satu untuk potongan vertikal  
C. Satu untuk mikroskop elektron, satu untuk H&E  
D. Satu untuk jaringan beku, satu untuk formalin  
E. Satu untuk bakteri, satu untuk jamur

4. Spesimen biopsi kulit rutin dikirim dalam…  
A. Larutan salin  
B. Michel medium  
C. Formalin netral buffer 10%  
D. Alkohol 95% tanpa formalin  
E. Larutan KOH

5. Pada cuaca dingin, ditambahkan etil alkohol 95% sebanyak 10% volume formalin untuk…  
A. Mencegah autolisis  
B. Mencegah pembekuan jaringan dan artefak beku  
C. Meningkatkan pewarnaan H&E  
D. Membunuh mikroorganisme  
E. Mempertahankan lemak

6. *Superficial reactive unit* kulit terdiri atas…  
A. Dermis retikularis dan pleksus vaskular profunda  
B. Epidermis, zona junctional, dan papillary body dengan pleksus vaskular superfisial  
C. Lobulus dan septum lemak subkutan  
D. Folikel rambut dan kelenjar sebasea saja  
E. Fasia dan otot

7. Penebalan epidermis akibat peningkatan proliferasi keratinosit disebut…  
A. Atrofi  
B. Akantosis  
C. Spongiosis  
D. Akantolisis  
E. Parakeratosis

8. Parakeratosis adalah…  
A. Penipisan epidermis  
B. Retensi nukleus piknotik di stratum korneum akibat kornifikasi yang cepat/abnormal  
C. Pelebaran ruang antar keratinosit  
D. Hilangnya kohesi primer antar keratinosit  
E. Pembentukan gelembung subepidermal

9. Gambaran histologis spongiosis adalah…  
A. Sel keratinosit membulat dan terpisah akibat hilangnya desmosom  
B. Akumulasi cairan di epidermis dengan ruang putih di antara keratinosit  
C. Penebalan kolagen dermis  
D. Nekrosis lemak subkutan  
E. Proliferasi sel basaloid

10. Pada *bullous pemphigoid*, cleft blister terbentuk di…  
A. Stratum korneum  
B. Stratum granulosum  
C. Lamina lucida zona junctional  
D. Hipodermis  
E. Fasia

11. Gambaran histologis psoriasis yang khas meliputi…  
A. Akantosis, rete ridge memanjang, lapisan granular menurun, parakeratosis, dan Munro microabscess  
B. Atrofi epidermis dan infiltrat band-like  
C. Granuloma palisading dengan nekrobiosis  
D. Panniculitis septal  
E. Proliferasi kapiler lobular dengan collarette epidermal

12. Pada dermatitis interface/lichenoid, infiltrat limfosit terutama terletak…  
A. Di subkutis  
B. Sepanjang dermal–epidermal junction dengan perubahan vakuolar sel basal  
C. Di sekitar folikel rambut saja  
D. Di dalam pembuluh darah  
E. Di septum lemak

13. Erythema nodosum merupakan contoh…  
A. Panniculitis lobular  
B. Panniculitis septal  
C. Vaskulitis nekrotikans  
D. Granuloma sarcoidal  
E. Tumor vaskular

14. Faktor yang digunakan untuk menilai benignitas versus malignansi tumor kulit adalah…  
A. Simetri, pola infiltrasi, sitologi, dan aktivitas mitosis  
B. Warna, gatal, nyeri, dan lokasi  
C. Kadar hemoglobin, leukosit, dan trombosit  
D. Uji KOH, kultur jamur, dan DIF  
E. Tekanan darah, suhu, dan nadi

15. Pada *dermatofibroma*, profil pewarnaan imunohistokimia yang khas adalah…  
A. CD34 positif, Factor XIIIa negatif  
B. Factor XIIIa positif, CD34 negatif  
C. S100 positif, HMB-45 positif  
D. CD31 positif, D2-40 positif  
E. Desmin positif, SMA negatif

<details class='sj-spoiler'>
<summary>Lihat kunci jawaban &amp; pembahasan</summary>

**Kunci Jawaban:**  
1. C  
2. B  
3. B  
4. C  
5. B  
6. B  
7. B  
8. B  
9. B  
10. C  
11. A  
12. B  
13. B  
14. A  
15. B

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Intergumen 2'>Lanjut ke materi inti →</a>
  <div><a href='Intergumen Pre-postest 3'>Sesi berikutnya →</a> · <a href='Intergumen Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->