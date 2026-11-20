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

<div class='sj-crumb'><a href='./'>sjawatdh.</a> / <a href='Kardiovaskular Landing'>Kardiovaskular</a> / Sesi 01</div>

# Sebelum belajar
**Kardiovaskular 1** · `15 soal` · `Pretest / Posttest`

Coba kerjakan sebelum membaca materi. Setelah selesai membaca materi, buka kembali halaman ini sebagai **posttest**.

---
<!-- SJAWATDH-HEAD:END -->

Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 22: Atopic Dermatitis**.

**Pilih satu jawaban yang paling tepat.**

1. Prevalensi atopic dermatitis (AD) mencapai puncaknya sekitar…  
    A. 1–2% pada usia lanjut  
    B. 15–20% pada anak usia dini di negara industri  
    C. 50% pada bayi baru lahir  
    D. 3–7% pada anak usia sekolah  
    E. 0,1% pada dewasa muda
    
2. Gejala utama (_hallmark_) atopic dermatitis adalah…  
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
    
6. Mutasi _loss-of-function_ gen yang paling konsisten menjadi faktor predisposisi utama AD pada populasi kulit putih Eropa dan Asia adalah…  
    A. _FLG_ (filaggrin)  
    B. _KRT5_  
    C. _COL7A1_  
    D. _DSG3_  
    E. _ABCC11_
    
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
    A. _Staphylococcus aureus_  
    B. _Streptococcus pyogenes_  
    C. _Candida albicans_  
    D. _Malassezia furfur_  
    E. _Herpes simplex virus_
    
10. Eczema herpeticum ditandai oleh…  
    A. Plak likenifikasi di lipatan fleksural  
    B. Vesikel umbilikasi, erosi _punched-out_, dan nyeri hebat  
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
    
13. Terapi topikal yang menjadi dasar (_cornerstone_) terapi antiinflamasi pada AD adalah…  
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
    B. Jarang diindikasikan dan dapat menyebabkan _rebound flare_ setelah dihentikan  
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
    

We need answer likely user wants MCQs in Indonesian based on provided chapter. Need create questions. Need ensure from text. Need produce 15? Previous pattern 15. Need answer. We need parse content. User only uploaded file no explicit ask, but prior pattern: "buat soal pilihan ganda indonesia". Need produce Indonesian MCQs based on file. Need include 15 with key. Need be accurate. Need note file has title "NILAI PRETEST Pre-postest kardiovascular 1" but content Chapter 232 Basic Biology of Cardiovascular System. Need generate. Desired oververbosity 5. Need maybe 15 soal. Need cover developmental, vascular, endothelial, smooth muscle, cardiac contraction, preload/afterload/contractility, metabolism, regeneration. Need answer.

Need be careful with facts:

- Heart forms early; cardiac progenitors in lateral splanchnic mesoderm; linear heart tube single layer endocardium and single layer cardiomyocyte precursors.
    
- Second heart field in pharyngeal mesoderm contributes to right atrium, right ventricle, outflow tract; Islet-1.
    
- Neural crest from dorsal neural tube orchestrates aortic arch remodeling and septation truncus arteriosus; smooth muscle tunica media aortic arch, ductus arteriosus, carotid from neural crest. Descending aorta smooth muscle lateral plate mesoderm; proximal outflow tract second heart field. Neural crest sensitive vitamin A and folic acid.
    
- Epicardial cells from proepicardial organ derivative septum transversum; contribute smooth muscle to coronary arteries, fibroblasts.
    
- Conduction: SA node from sinus venosus, AV node from AV canal; decremental conduction AV node delays; distal fast.
    
- Vascular ultrastructure: capillaries monolayer endothelial + basement membrane + discontinuous pericytes; arteries trilaminar intima, media, adventitia; vasa vasorum; internal/external elastic lamina.
    
- Endothelial functions: barrier, vasodilation via prostacyclin, EDHF, NO, H2O2; vasoconstrictor endothelin; activated express adhesion molecules; PAI-1, tissue factor; regulate smooth muscle growth via heparan sulfate inhibit, PDGF promote.
    
- Smooth muscle contraction: Ca via L-type VDCC, IP3, SR; myosin light chain phosphorylation balance MLCK/MLCP; Ca-calmodulin activates MLCK.
    
- Autonomic: sympathetic epinephrine/norepinephrine; parasympathetic ACh; nitrergic NO; peptidergic substance P, VIP, CGRP, ATP. Norepinephrine α1 large arteries α2 small; β2 relaxation via cAMP. ACh muscarinic vasorelaxation.
    
- Angiogenesis VEGF/FGF; arteriogenesis not normally adult.
    
- Cardiac ultrastructure: sarcomere between Z lines 1.6-2.2; A band constant 1.5; thick myosin, thin actin/tropomyosin/troponin; sliding filament; myosin ATPase; troponin C binds Ca; SERCA2A uptake; phospholamban; RyR2; calstabin2; Na/Ca exchanger.
    
- Control: preload length, afterload tension, contractility. Starling. Laplace. Ejection fraction normal 67±8%; EDV 75±20 mL/m2; ESV 25±7. Exercise increases preload and contractility, vasodilation limits afterload.
    
- Diastolic function: relaxation rate Ca uptake SR; stiffness hypertrophy/infiltrate/amyloid/pericardial.
    
- Metabolism: ATP from glucose and FFA; fasted FFA ~70%; fed glucose; severe ischemia anaerobic glycolysis to lactate; CP stores decline first.
    
- Regeneration limited.
    

Need make questions. Need answer key. Need maybe include "Pilih satu jawaban paling tepat." Use Indonesian. Need ensure no ambiguity.

Need maybe 15 questions. Could include from text. Need no need cite. Need maybe mention "berdasarkan Bab 232". Good.

Need perhaps include correct answer only at end. Need avoid too long.

Let's craft 15 MCQs:

1. Asal progenitor kardiak awal: lateral splanchnic mesoderm.
    
2. Second heart field berkontribusi: RA, RV, outflow tract.
    
3. Sel neural crest diperlukan untuk: remodeling aortic arch dan septasi truncus arteriosus.
    
4. Smooth muscle tunica media descending aorta berasal: lateral plate mesoderm (vs neural crest for aortic arch/carotid).
    
5. Proepicardial organ derivative septum transversum contributes: smooth muscle coronary arteries and fibroblasts.
    
6. SA node precursor: sinus venosus; AV node AV canal.
    
7. Capillary structure: endothelial monolayer + basement membrane + discontinuous pericytes.
    
8. Large elastic artery media: concentric bands smooth muscle interspersed elastin-rich ECM; internal/external elastic lamina.
    
9. Endothelial activated by cytokines/endotoxin/Ang II produces PAI-1 and tissue factor -> prothrombotic.
    
10. Endothelial regulation of smooth muscle: heparan sulfate inhibits; PDGF promotes migration/proliferation.
    
11. Vascular smooth muscle contraction depends on: myosin light chain phosphorylation balance MLCK/MLCP; Ca-calmodulin activates MLCK.
    
12. Norepinephrine in most vessels: α1 large arteries and α2 small arteries/arterioles -> vasoconstriction; β2 relaxation via cAMP.
    
13. Sarcomere: A band constant length; I band shortens; Z lines move closer. Or thick myosin thin actin.
    
14. Ca-induced Ca release from SR through RyR2; SERCA2A uptake; phospholamban.
    
15. Preload/afterload: Laplace law and Starling; afterload increased reduces shortening; dilated LV higher afterload at same pressure.
    
16. Ejection fraction normal 67±8; depressed in systolic HF.
    
17. Metabolism: fasted FFA ~70%; severe ischemia anaerobic glycolysis lactate; CP declines first.
    
18. Regeneration limited.
    

Need 15. Could choose one from each. Need include answer. Let's ensure all facts.

Need maybe question about "decremental conduction through AV node delays impulses" but not necessary.

Need question about "vitamin A/folic acid deficiency associated with congenital heart disease involving aortic arch remodeling" maybe include.

Need final in Indonesian. Should be concise. Need no extra. Use table? Fine.

Need answer key. Let's produce.

Berikut 15 soal pilihan ganda dalam bahasa Indonesia berdasarkan **Bab 232: Basic Biology of the Cardiovascular System**.

**Pilih satu jawaban yang paling tepat.**

1. Progenitor kardiak awal pada perkembangan embrio berasal dari…  
    A. Neural crest dorsalis  
    B. Mesoderm splanknik lateral  
    C. Endoderm faringeal  
    D. Septum transversum  
    E. Ektoderm permukaan
    
2. _Second heart field_ di mesoderm faringeal terutama berkontribusi pada pembentukan…  
    A. Ventrikel kiri dan atrium kiri saja  
    B. Atrium kanan, ventrikel kanan, dan outflow tract  
    C. Katup mitral dan aorta desendens  
    D. Sinus venosus dan vena cava  
    E. Koroner dan perikardium
    
3. Sel neural crest dari neural tube dorsalis diperlukan untuk…  
    A. Pembentukan kapiler dan perisit  
    B. Remodeling arkus aorta dan septasi truncus arteriosus  
    C. Pembentukan SA node dan AV node  
    D. Pembentukan miokardium ventrikel kiri  
    E. Pembentukan katup atrioventrikular
    
4. Otot polos pada tunika media **aorta desendens** berasal dari…  
    A. Neural crest  
    B. Mesoderm lempeng lateral  
    C. Second heart field  
    D. Proepicardium  
    E. Endokardium
    
5. Proepicardial organ merupakan turunan dari septum transversum dan berperan dalam…  
    A. Membentuk sel darah dan endotel  
    B. Menyumbang otot polos arteri koroner dan fibroblast jantung  
    C. Membentuk SA node dan berkas His  
    D. Membentuk katup semilunar  
    E. Membentuk arkus aorta
    
6. Prekursor SA node berasal dari…  
    A. Sinus venosus  
    B. Kanal atrioventrikular  
    C. Truncus arteriosus  
    D. Bulbus kordis  
    E. Vena umbilikalis
    
7. Struktur kapiler yang benar adalah…  
    A. Tiga lapisan otot polos dan adventisia tebal  
    B. Monolapisan sel endotel pada membran basalis dengan perisit diskontinu  
    C. Endotel berlapis ganda dengan lamina elastika interna  
    D. Hanya terdiri dari fibroblast dan matriks kolagen  
    E. Lapisan otot polos sirkular tanpa endotel
    
8. Ciri khas arteri elastis besar seperti aorta adalah…  
    A. Tidak memiliki tunika media  
    B. Media tersusun dari pita konsentris otot polos diselingi matriks kaya elastin  
    C. Hanya memiliki satu lapisan endotel tanpa adventisia  
    D. Media didominasi perisit  
    E. Tidak memiliki vasa vasorum
    
9. Endotel yang teraktivasi oleh sitokin inflamasi, endotoksin, atau angiotensin II dapat…  
    A. Menurunkan PAI-1 dan tissue factor  
    B. Meningkatkan PAI-1 dan tissue factor sehingga prokoagulan  
    C. Menghambat seluruh adhesi leukosit  
    D. Meningkatkan produksi NO secara masif  
    E. Menghambat proliferasi otot polos melalui PDGF
    
10. Endotel mengatur pertumbuhan otot polos vaskular melalui…  
    A. Heparan sulfat menghambat proliferasi; PDGF memicu migrasi dan proliferasi  
    B. Heparan sulfat memicu proliferasi; PDGF menghambat  
    C. Hanya melalui NO tanpa faktor pertumbuhan  
    D. Hanya melalui endotelin-1  
    E. Tidak memiliki peran pada otot polos
    
11. Kontraksi otot polos vaskular terutama bergantung pada…  
    A. Fosforilasi miosin light chain yang ditentukan keseimbangan MLCK dan MLCP  
    B. Fosforilasi troponin C oleh protein kinase A  
    C. Interaksi troponin-tropomiosin dengan aktin  
    D. Depolarisasi kanal ENaC  
    E. Pelepasan histamin dari sel mast
    
12. Pada sebagian besar pembuluh darah, norepinefrin menyebabkan vasokonstriksi melalui…  
    A. Reseptor α1 pada arteri besar dan α2 pada arteri kecil/arteriol  
    B. Reseptor β2 pada arteri besar dan α1 pada arteriol  
    C. Reseptor muskarinik M3  
    D. Reseptor histamin H1  
    E. Reseptor purinergik P2Y
    
13. Selama kontraksi otot jantung, pernyataan yang benar mengenai sarkomer adalah…  
    A. Pita A memendek, pita I memanjang  
    B. Pita A tetap, pita I memendek, dan garis Z saling mendekat  
    C. Filamen tebal dan tipis memendek  
    D. Garis Z saling menjauh  
    E. Tropomiosin terdegradasi total
    
14. Pelepasan kalsium dari retikulum sarkoplasma jantung terutama melalui…  
    A. Reseptor rianodin tipe 2 (RyR2)  
    B. Kanal ENaC  
    C. Pertukaran Na+/Ca2+  
    D. Pompa SERCA2A  
    E. Kanal CFTR
    
15. Peningkatan afterload pada ventrikel kiri akan…  
    A. Meningkatkan fraksi ejeksi secara langsung  
    B. Menurunkan derajat pemendekan serat miokard pada preload dan kontraktilitas tertentu  
    C. Tidak memengaruhi stroke volume  
    D. Menurunkan tekanan arteri sistemik  
    E. Meningkatkan volume end-diastolik tanpa efek pada pemendekan serat
    

**Kunci Jawaban:**

1. B
    
2. B
    
3. B
    
4. B
    
5. B
    
6. A
    
7. B
    
8. B
    
9. B
    
10. A
    
11. A
    
12. A
    
13. B
    
14. A
    
15. B

</details>

<!-- SJAWATDH-NAV:BEGIN -->

<div class='sj-stepper'>
  <a href='Kardiovaskular 1'>Lanjut ke materi inti →</a>
  <div><a href='Kardiovaskular Pre-postest 2'>Sesi berikutnya →</a> · <a href='Kardiovaskular Landing'>Daftar sesi</a></div>
</div>
<!-- SJAWATDH-NAV:END -->