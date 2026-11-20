---
title: sjawatdh. — catatan belajar kedokteran
description: Tempat buat belajar blok tanpa ribet. Materi, pretest, dan posttest dari dasar sampai klinis.
showToc: false
showLinkPreviews: false
---

<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,400&family=Fraunces:ital,opsz,wght@0,9..144,500;0,9..144,600;1,9..144,400&family=IBM+Plex+Mono:wght@400;500&display=swap');

:root {
  --bg-paper: #FAF7F2;
  --surface-card: #FFFFFF;
  --surface-tint: #F3EDE2;
  --ink-primary: #1C1917;
  --ink-secondary: #57534E;
  --ink-muted: #78716C;
  --accent-teal: #115E59;
  --border-hairline: #E7E0D5;
}

aside, nav[aria-label='Table of contents'], .toc, [class*='toc'], [class*='backlinks'], [class*='footer'] {
  display: none !important;
}

body, main {
  background-color: var(--bg-paper) !important;
  color: var(--ink-primary) !important;
  font-family: 'DM Sans', -apple-system, BlinkMacSystemFont, sans-serif !important;
}

.sj-shell {
  max-width: 960px;
  margin: 0 auto;
  padding: 1.5rem 1.25rem 4rem;
}

.sj-topbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 1.25rem;
  border-bottom: 1px solid var(--border-hairline);
  margin-bottom: 2.75rem;
}

.sj-brand {
  font-family: 'Fraunces', Georgia, serif;
  font-size: 1.35rem;
  font-weight: 600;
  letter-spacing: -0.02em;
  color: var(--ink-primary) !important;
  text-decoration: none !important;
}

.sj-navlinks {
  display: flex;
  gap: 1.25rem;
  font-size: 0.9rem;
}

.sj-navlinks a {
  color: var(--ink-secondary) !important;
  text-decoration: none !important;
  transition: color 0.15s ease;
}

.sj-navlinks a:hover {
  color: var(--accent-teal) !important;
}

.sj-hero {
  display: grid;
  grid-template-columns: 1.45fr 1fr;
  gap: 2rem;
  align-items: center;
  margin-bottom: 3.5rem;
}

@media (max-width: 768px) {
  .sj-hero {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
}

.sj-eyebrow {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--accent-teal);
  letter-spacing: 0.04em;
  margin-bottom: 0.75rem;
  display: block;
}

.sj-hero-title {
  font-family: 'Fraunces', Georgia, serif !important;
  font-size: clamp(2.1rem, 4.2vw, 3.1rem) !important;
  line-height: 1.12 !important;
  font-weight: 500 !important;
  letter-spacing: -0.025em !important;
  color: var(--ink-primary) !important;
  margin: 0 0 1rem 0 !important;
  border: none !important;
}

.sj-hero-desc {
  font-size: 1.05rem;
  line-height: 1.6;
  color: var(--ink-secondary);
  margin: 0 0 1.5rem 0;
  max-width: 46ch;
}

.sj-cta-primary {
  display: inline-block;
  background-color: var(--ink-primary);
  color: var(--bg-paper) !important;
  padding: 0.65rem 1.25rem;
  border-radius: 6px;
  font-size: 0.92rem;
  font-weight: 500;
  text-decoration: none !important;
  transition: background-color 0.15s ease, transform 0.15s ease;
}

.sj-cta-primary:hover {
  background-color: var(--accent-teal);
  transform: translateY(-1px);
}

.sj-broty-card {
  background-color: var(--surface-card);
  border: 1px solid var(--border-hairline);
  border-radius: 12px;
  padding: 1.25rem;
  box-shadow: 0 2px 10px rgba(28, 25, 23, 0.03);
}

.sj-broty-header {
  display: flex;
  align-items: center;
  gap: 0.85rem;
  margin-bottom: 0.65rem;
}

.sj-broty-name {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--ink-muted);
}

.sj-broty-text {
  font-size: 0.92rem;
  line-height: 1.55;
  color: var(--ink-secondary);
  margin: 0;
}

.sj-section-head {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  border-bottom: 1px solid var(--border-hairline);
  padding-bottom: 0.65rem;
  margin-bottom: 1.25rem;
}

.sj-section-title {
  font-family: 'Fraunces', Georgia, serif !important;
  font-size: 1.35rem !important;
  font-weight: 500 !important;
  margin: 0 !important;
  border: none !important;
}

.sj-section-meta {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--ink-muted);
}

.sj-block-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.9rem;
  margin-bottom: 3rem;
}

@media (max-width: 820px) {
  .sj-block-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 540px) {
  .sj-block-grid { grid-template-columns: 1fr; }
}

.sj-block-tile {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background: var(--surface-card);
  border: 1px solid var(--border-hairline);
  border-radius: 10px;
  padding: 1.1rem 1.15rem;
  text-decoration: none !important;
  color: inherit !important;
  transition: border-color 0.18s ease, transform 0.18s ease, box-shadow 0.18s ease;
}

.sj-block-tile:hover {
  border-color: var(--accent-teal);
  transform: translateY(-2px);
  box-shadow: 0 6px 18px rgba(17, 94, 89, 0.07);
}

.sj-tile-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.55rem;
}

.sj-tile-num {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.78rem;
  color: var(--accent-teal);
}

.sj-tile-count {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.74rem;
  color: var(--ink-muted);
  background: var(--surface-tint);
  padding: 0.15rem 0.5rem;
  border-radius: 4px;
}

.sj-tile-name {
  font-family: 'Fraunces', Georgia, serif;
  font-size: 1.18rem;
  font-weight: 500;
  color: var(--ink-primary);
  margin-bottom: 0.35rem;
}

.sj-tile-desc {
  font-size: 0.85rem;
  line-height: 1.45;
  color: var(--ink-secondary);
  margin-bottom: 0.85rem;
}

.sj-tile-action {
  font-size: 0.82rem;
  font-weight: 500;
  color: var(--accent-teal);
}

.sj-session-list {
  display: flex;
  flex-direction: column;
  gap: 0.65rem;
  margin-bottom: 2.5rem;
}

.sj-session-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
  background: var(--surface-card);
  border: 1px solid var(--border-hairline);
  border-radius: 9px;
  padding: 0.95rem 1.15rem;
  text-decoration: none !important;
  color: inherit !important;
  transition: border-color 0.15s ease, background-color 0.15s ease;
}

.sj-session-row:hover {
  border-color: var(--accent-teal);
  background: #FFFEFC;
}

@media (max-width: 600px) {
  .sj-session-row {
    flex-direction: column;
    align-items: flex-start;
  }
}

.sj-session-left {
  display: flex;
  align-items: baseline;
  gap: 0.85rem;
}

.sj-session-idx {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.82rem;
  color: var(--accent-teal);
}

.sj-session-title {
  font-weight: 600;
  font-size: 1rem;
  color: var(--ink-primary);
}

.sj-session-sub {
  font-size: 0.82rem;
  color: var(--ink-muted);
  margin-top: 0.15rem;
}

.sj-session-cta {
  font-family: 'IBM Plex Mono', monospace;
  font-size: 0.8rem;
  color: var(--accent-teal);
  white-space: nowrap;
}

.sj-footer {
  border-top: 1px solid var(--border-hairline);
  padding-top: 1.25rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 0.75rem;
  font-size: 0.84rem;
  color: var(--ink-muted);
}

.sj-footer a {
  color: var(--ink-secondary) !important;
  text-decoration: none !important;
}

.sj-footer a:hover {
  color: var(--accent-teal) !important;
}
</style>

<div class='sj-shell'>
  <header class='sj-topbar'>
    <a class='sj-brand' href='./'>sjawatdh.</a>
    <nav class='sj-navlinks'>
      <a href='#blok'>Blok Sistem</a>
      <a href='Untuk%20Sjawatdh%20(Landing)'>Tentang</a>
    </nav>
  </header>

  <section class='sj-hero'>
    <div>
      <span class='sj-eyebrow'>9 BLOK · 18 SESI BELAJAR</span>
      <h1 class='sj-hero-title'>belajar blok, pelan-pelan sampai paham.</h1>
      <p class='sj-hero-desc'>Catatan belajar kedokteran dari dasar sampai klinis. Lengkap dengan pretest dan posttest buat nemenin kamu ngejar pemahaman tanpa ribet.</p>
      <a class='sj-cta-primary' href='#blok'>Pilih blok hari ini →</a>
    </div>

    <div class='sj-broty-card'>
      <div class='sj-broty-header'>
        <svg width='50' height='50' viewBox='0 0 100 100' aria-hidden='true' style='flex-shrink:0;'>
  <ellipse cx='50' cy='55' rx='32' ry='28' fill='#FBCFE8' />
  <ellipse cx='50' cy='62' rx='20' ry='15' fill='#FDF2F8' />
  <ellipse cx='18' cy='38' rx='7' ry='3' fill='#F9A8D4' transform='rotate(-30 18 38)' />
  <ellipse cx='15' cy='45' rx='7' ry='3' fill='#F9A8D4' transform='rotate(-10 15 45)' />
  <ellipse cx='16' cy='52' rx='7' ry='3' fill='#F9A8D4' transform='rotate(10 16 52)' />
  <ellipse cx='82' cy='38' rx='7' ry='3' fill='#F9A8D4' transform='rotate(30 82 38)' />
  <ellipse cx='85' cy='45' rx='7' ry='3' fill='#F9A8D4' transform='rotate(10 85 45)' />
  <ellipse cx='84' cy='52' rx='7' ry='3' fill='#F9A8D4' transform='rotate(-10 84 52)' />
  <circle cx='40' cy='48' r='4.5' fill='#1C1917' />
  <circle cx='60' cy='48' r='4.5' fill='#1C1917' />
  <circle cx='41.5' cy='46.5' r='1.5' fill='#FFFFFF' />
  <circle cx='61.5' cy='46.5' r='1.5' fill='#FFFFFF' />
  <circle cx='30' cy='58' r='3' fill='#FB7185' opacity='0.45' />
  <circle cx='70' cy='58' r='3' fill='#FB7185' opacity='0.45' />
  <path d='M45 60 Q50 64 55 60' stroke='#1C1917' stroke-width='1.8' fill='none' stroke-linecap='round' />
</svg>
        <span class='sj-broty-name'>broty // study companion</span>
      </div>
      <p class='sj-broty-text'>Hai! Mau mulai dari blok mana hari ini? Tiap sesi udah disusun berurutan dari pretest, materi, sampai posttest biar kamu tinggal ngikutin alurnya.</p>
    </div>
  </section>

  <div id='blok' class='sj-section-head'>
    <h2 class='sj-section-title'>Mau belajar blok apa hari ini?</h2>
    <span class='sj-section-meta'>9 sistem organ</span>
  </div>

  <div class='sj-block-grid'>
<a class='sj-block-tile' href='Endokrin Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>01</span>
      <span class='sj-tile-count'>3 sesi</span>
    </div>
    <div class='sj-tile-name'>Endokrin</div>
    <div class='sj-tile-desc'>Regulasi hormon, tiroid, dan metabolisme.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Gastrointestinal Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>02</span>
      <span class='sj-tile-count'>1 sesi</span>
    </div>
    <div class='sj-tile-name'>Gastrointestinal</div>
    <div class='sj-tile-desc'>Saluran cerna, hepatobilier, dan pankreas.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Hematoimmuno Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>03</span>
      <span class='sj-tile-count'>1 sesi</span>
    </div>
    <div class='sj-tile-name'>Hematoimmuno</div>
    <div class='sj-tile-desc'>Hematologi klinis, hemostasis, dan imunologi.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Intergumen Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>04</span>
      <span class='sj-tile-count'>6 sesi</span>
    </div>
    <div class='sj-tile-name'>Intergumen</div>
    <div class='sj-tile-desc'>Morfologi lesi kulit dan korelasi patologi.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Kardiovaskular Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>05</span>
      <span class='sj-tile-count'>2 sesi</span>
    </div>
    <div class='sj-tile-name'>Kardiovaskular</div>
    <div class='sj-tile-desc'>Hemodinamika, iskemia, aritmia, dan gagal jantung.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Nefro Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>06</span>
      <span class='sj-tile-count'>1 sesi</span>
    </div>
    <div class='sj-tile-name'>Nefro</div>
    <div class='sj-tile-desc'>Fisiologi ginjal, elektrolit, dan saluran kemih.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Neuro Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>07</span>
      <span class='sj-tile-count'>1 sesi</span>
    </div>
    <div class='sj-tile-name'>Neuro</div>
    <div class='sj-tile-desc'>Lokalisasi lesi saraf dan kegawatan neurologis.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='ObsGyn Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>08</span>
      <span class='sj-tile-count'>2 sesi</span>
    </div>
    <div class='sj-tile-name'>ObsGyn</div>
    <div class='sj-tile-desc'>Fisiologi kehamilan, obstetri, dan reproduksi.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
<a class='sj-block-tile' href='Pulmo Landing'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>09</span>
      <span class='sj-tile-count'>1 sesi</span>
    </div>
    <div class='sj-tile-name'>Pulmo</div>
    <div class='sj-tile-desc'>Mekanika napas dan penyakit paru klinis.</div>
  </div>
  <span class='sj-tile-action'>Buka blok →</span>
</a>
  </div>

  <footer class='sj-footer'>
    <span>sjawatdh. · disarikan dari Harrison's &amp; referensi klinis untuk studi personal.</span>
    <a href='Untuk%20Sjawatdh%20(Landing)'>Tentang &amp; Manifesto →</a>
  </footer>
</div>