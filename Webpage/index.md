---
title: sjawatdh.
description: belajar blok, pelan-pelan sampai paham.
showToc: false
showLinkPreviews: false
---

<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,400&family=IBM+Plex+Mono:wght@400;500&family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;1,6..72,400&display=swap');

:root {
  --bg-paper: #FAF7F2;
  --surface: #FFFFFF;
  --surface-subtle: #F3EDE2;
  --ink: #1C1917;
  --ink-soft: #57534E;
  --ink-muted: #78716C;
  --accent: #3F6212;
  --line: #E7E0D5;
}

aside, nav[aria-label='Table of contents'], .toc, [class*='toc'], [class*='backlinks'], [class*='footer'] {
  display: none !important;
}

body, main {
  background-color: var(--bg-paper) !important;
  color: var(--ink) !important;
  font-family: 'DM Sans', -apple-system, BlinkMacSystemFont, sans-serif !important;
}

.sj-wrap {
  max-width: 880px;
  margin: 0 auto;
  padding: 1.5rem 1.25rem 4rem;
}

.sj-nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 1.1rem;
  border-bottom: 1px solid var(--line);
  margin-bottom: 3rem;
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

.sj-hero {
  display: grid;
  grid-template-columns: 1.5fr 1fr;
  gap: 2.5rem;
  align-items: end;
  margin-bottom: 3.75rem;
}

@media (max-width: 720px) {
  .sj-hero {
    grid-template-columns: 1fr;
    gap: 1.75rem;
  }
}

.sj-h1 {
  font-family: 'Newsreader', Georgia, serif !important;
  font-size: clamp(2.25rem, 4.6vw, 3.25rem) !important;
  line-height: 1.1 !important;
  font-weight: 400 !important;
  letter-spacing: -0.02em !important;
  color: var(--ink) !important;
  margin: 0 0 1rem 0 !important;
  border: none !important;
}

.sj-lead {
  font-size: 1.05rem;
  line-height: 1.55;
  color: var(--ink-soft);
  margin: 0 0 1.5rem 0;
  max-width: 42ch;
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
  font-size: 1.5rem !important;
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
  margin-bottom: 3.5rem;
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
  color: var(--accent);
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

<div class='sj-wrap'>
  <header class='sj-nav'>
    <a class='sj-logo' href='./'>sjawatdh.</a>
    <nav class='sj-nav-right'>
      <a href='#blok'>blok</a>
      <a href='Untuk%20Sjawatdh%20(Landing)'>tentang</a>
    </nav>
  </header>

  <section class='sj-hero'>
    <div>
      <h1 class='sj-h1'>belajar blok,<br>pelan-pelan sampai paham.</h1>
      <p class='sj-lead'>Materi dan latihan belajar kedokteran.</p>
      <a class='sj-btn' href='#blok'>mulai belajar ↓</a>
    </div>

    <div class='sj-broty-note'>
      <svg width='44' height='44' viewBox='0 0 100 100' aria-hidden='true' style='flex-shrink:0;'>
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
      <p class='sj-broty-copy'><strong>hai, aku Broty.</strong><br>mau belajar apa hari ini?</p>
    </div>
  </section>

  <div id='blok' class='sj-index-head'>
    <h2 class='sj-h2'>pilih blok.</h2>
    <span class='sj-mono'>9 blok · 18 sesi</span>
  </div>

  <div class='sj-index-list'>
<a class='sj-index-row' href='Endokrin Landing'>
  <span class='sj-row-num'>01</span>
  <span class='sj-row-title'>Endokrin</span>
  <span class='sj-row-meta'>3 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Gastrointestinal Landing'>
  <span class='sj-row-num'>02</span>
  <span class='sj-row-title'>Gastrointestinal</span>
  <span class='sj-row-meta'>1 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Hematoimmuno Landing'>
  <span class='sj-row-num'>03</span>
  <span class='sj-row-title'>Hematoimmuno</span>
  <span class='sj-row-meta'>1 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Intergumen Landing'>
  <span class='sj-row-num'>04</span>
  <span class='sj-row-title'>Intergumen</span>
  <span class='sj-row-meta'>6 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Kardiovaskular Landing'>
  <span class='sj-row-num'>05</span>
  <span class='sj-row-title'>Kardiovaskular</span>
  <span class='sj-row-meta'>2 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Nefro Landing'>
  <span class='sj-row-num'>06</span>
  <span class='sj-row-title'>Nefro</span>
  <span class='sj-row-meta'>1 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Neuro Landing'>
  <span class='sj-row-num'>07</span>
  <span class='sj-row-title'>Neuro</span>
  <span class='sj-row-meta'>1 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='ObsGyn Landing'>
  <span class='sj-row-num'>08</span>
  <span class='sj-row-title'>ObsGyn</span>
  <span class='sj-row-meta'>2 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
<a class='sj-index-row' href='Pulmo Landing'>
  <span class='sj-row-num'>09</span>
  <span class='sj-row-title'>Pulmo</span>
  <span class='sj-row-meta'>1 sesi</span>
  <span class='sj-row-arrow'>→</span>
</a>
  </div>

  <footer class='sj-foot'>
    <span>sjawatdh. · catatan belajar kedokteran</span>
    <a href='Untuk%20Sjawatdh%20(Landing)'>tentang ruang belajar ini →</a>
  </footer>
</div>