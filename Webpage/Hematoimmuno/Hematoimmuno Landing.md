---
title: Hematoimmuno — sjawatdh.
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
      <a href='./'>blok</a>
      <a href='Untuk%20Sjawatdh%20(Landing)'>tentang</a>
    </nav>
  </header>

  <div style='margin-bottom:2.25rem;'>
    <span class='sj-mono'>HEMATOIMMUNO · 03</span>
    <h1 class='sj-h1' style='margin-top:0.35rem !important;'>Hematoimmuno</h1>
    <span class='sj-mono'>1 sesi</span>
  </div>

  <div class='sj-index-list'>
<a class='sj-index-row' href='Hematoimmuno Pre-postest 1'>
  <span class='sj-row-num'>01</span>
  <div>
    <div class='sj-row-title'>Hematoimmuno 1</div>
    <div class='sj-mono'>Dasar · Introduction to the Immune System</div>
  </div>
  <span class='sj-row-meta'>15 soal</span>
  <span class='sj-row-arrow'>→</span>
</a>
  </div>

---

## Daftar Sesi Pembelajaran

| Sesi | Topik Pembelajaran | Kategori | Alur | Aksi |
| :---: | :--- | :---: | :--- | :---: |
| 01 | **Hematoimmuno 1** | Dasar | Pretest → Materi → Posttest | [[Hematoimmuno Pre-postest 1\|Mulai Sesi 1 →]] |

---

## Daftar Sesi Pembelajaran

| Sesi | Topik Pembelajaran | Kategori | Alur | Aksi |
| :---: | :--- | :---: | :--- | :---: |
| 01 | **Hematoimmuno 1** | Dasar | Pretest → Materi → Posttest | [[Hematoimmuno Pre-postest 1\|Mulai Sesi 1 →]] |

---

## 📋 Daftar Sesi Blok Hematoimmuno

Klik **Mulai Sesi** pada topik di bawah. Setiap sesi memandu kamu berurutan lewat **Pretest → Materi → Posttest** melalui bilah navigasi di bawah halaman.

| Sesi | Topik Pembelajaran | Alur Otomatis | Aksi |
| :---: | :--- | :--- | :---: |
| **Sesi 1** | **Hematoimmuno 1** (🟢 Dasar) | Pretest → Materi → Posttest | [[Hematoimmuno Pre-postest 1|▶️ Mulai Sesi 1 →]] |

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

  <footer class='sj-foot'>
    <a href='./'>← kembali ke blok</a>
    <span>sjawatdh.</span>
  </footer>
</div>

  <footer class='sj-foot'>
    <a href='./'>← kembali ke blok</a>
    <span>sjawatdh.</span>
  </footer>
</div>