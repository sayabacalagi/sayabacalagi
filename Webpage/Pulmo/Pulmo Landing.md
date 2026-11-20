---
title: Blok Pulmo — sjawatdh.
description: Mekanika napas dan penyakit paru klinis.
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
      <a href='./'>Semua Blok</a>
      <a href='Untuk%20Sjawatdh%20(Landing)'>Tentang</a>
    </nav>
  </header>

  <section class='sj-hero'>
    <div>
      <span class='sj-eyebrow'>BLOK 09 · 1 SESI</span>
      <h1 class='sj-hero-title'>Pulmo</h1>
      <p class='sj-hero-desc'>Mekanika napas dan penyakit paru klinis.</p>
      <a class='sj-cta-primary' href='Pulmo Pre-postest 1'>Mulai dari Sesi 01 →</a>
    </div>

    <div class='sj-broty-card'>
      <div class='sj-broty-header'>
        <svg width='46' height='46' viewBox='0 0 100 100' aria-hidden='true' style='flex-shrink:0;'>
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
        <span class='sj-broty-name'>broty // catatan sesi</span>
      </div>
      <p class='sj-broty-text'>Kerjakan pretest dulu buat lihat bagian mana yang masih kosong, lanjut baca materi pelan-pelan, lalu tutup dengan posttest.</p>
    </div>
  </section>

  <div class='sj-section-head'>
    <h2 class='sj-section-title'>Daftar Sesi</h2>
    <span class='sj-section-meta'>1 modul</span>
  </div>

  <div class='sj-session-list'>
<a class='sj-session-row' href='Pulmo Pre-postest 1'>
  <div class='sj-session-left'>
    <span class='sj-session-idx'>01</span>
    <div>
      <div class='sj-session-title'>Pulmo 1</div>
      <div class='sj-session-sub'>Dasar · 01 Pretest → 02 Materi → 03 Posttest</div>
    </div>
  </div>
  <span class='sj-session-cta'>Mulai sesi →</span>
</a>
  </div>

---

## Daftar Sesi Pembelajaran

| Sesi | Topik Pembelajaran | Kategori | Alur | Aksi |
| :---: | :--- | :---: | :--- | :---: |
| 01 | **Pulmo 1** | Dasar | Pretest → Materi → Posttest | [[Pulmo Pre-postest 1\|Mulai Sesi 1 →]] |

---

## Daftar Sesi Pembelajaran

| Sesi | Topik Pembelajaran | Kategori | Alur | Aksi |
| :---: | :--- | :---: | :--- | :---: |
| 01 | **Pulmo 1** | Dasar | Pretest → Materi → Posttest | [[Pulmo Pre-postest 1\|Mulai Sesi 1 →]] |

---

## 📋 Daftar Sesi Blok Pulmo

Klik **Mulai Sesi** pada topik di bawah. Setiap sesi memandu kamu berurutan lewat **Pretest → Materi → Posttest** melalui bilah navigasi di bawah halaman.

| Sesi | Topik Pembelajaran | Alur Otomatis | Aksi |
| :---: | :--- | :--- | :---: |
| **Sesi 1** | **Pulmo 1** (🟢 Dasar) | Pretest → Materi → Posttest | [[Pulmo Pre-postest 1|▶️ Mulai Sesi 1 →]] |

---

## 🎯 Target Kompetensi & Clinical Pearl





---

<div align="center">

[[index|← Kembali ke Direktori Sistem Organ]]

</div>

---

[[index|← Kembali ke Daftar Blok]] · [[Untuk Sjawatdh (Landing)|Tentang Sjawatdh]]

---

[[index|← Kembali ke Daftar Blok]] · [[Untuk Sjawatdh (Landing)|Tentang Sjawatdh]]

  <footer class='sj-footer'>
    <span><a href='./'>← Kembali ke semua blok</a></span>
    <span>sjawatdh. · personal medical study space</span>
  </footer>
</div>