Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
$NavBegin  = '<!-- SJAWATDH-NAV:BEGIN -->'
$NavEnd    = '<!-- SJAWATDH-NAV:END -->'
$Arrow     = [string][char]0x2192
$LeftArrow = [string][char]0x2190
$EmDash    = [string][char]0x2014
$MidDot    = [string][char]0x00B7

function Write-Utf8File {
    param([string]$Path, [string]$Content)
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Remove-ExistingNav {
    param([string]$Raw)
    $clean = [regex]::Replace($Raw, "(?s)\r?\n?$([regex]::Escape($NavBegin)).*?$([regex]::Escape($NavEnd))\r?\n?", '')
    $clean = [regex]::Replace($clean, '(?s)\r?\n?<!-- LMS-NAV:BEGIN -->.*?<!-- LMS-NAV:END -->\r?\n?', '')
    $clean = [regex]::Replace($clean, '(?s)\r?\n---\r?\n> \[!info\] \*\*Navigasi Sesi LMS\*\*.*$', '')
    return $clean.TrimEnd()
}

function Get-SharedEditorialCss {
    return "<style>
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
</style>"
}

function Get-BrotySvg {
    param([int]$Size = 52)
    return "<svg width='$Size' height='$Size' viewBox='0 0 100 100' aria-hidden='true' style='flex-shrink:0;'>
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
</svg>"
}

function Get-BlockStructure {
    param([string]$WebpageRoot)

    $descriptions = @{
        'Endokrin'         = 'Regulasi hormon, tiroid, dan metabolisme.'
        'Gastrointestinal' = 'Saluran cerna, hepatobilier, dan pankreas.'
        'Hematoimmuno'     = 'Hematologi klinis, hemostasis, dan imunologi.'
        'Intergumen'       = 'Morfologi lesi kulit dan korelasi patologi.'
        'Kardiovaskular'   = 'Hemodinamika, iskemia, aritmia, dan gagal jantung.'
        'Nefro'            = 'Fisiologi ginjal, elektrolit, dan saluran kemih.'
        'Neuro'            = 'Lokalisasi lesi saraf dan kegawatan neurologis.'
        'ObsGyn'           = 'Fisiologi kehamilan, obstetri, dan reproduksi.'
        'Pulmo'            = 'Mekanika napas dan penyakit paru klinis.'
    }

    $blocks = @()
    $idx = 1
    Get-ChildItem -Path $WebpageRoot -Directory | Sort-Object Name | ForEach-Object {
        $name    = $_.Name
        $dirPath = $_.FullName
        $landing = Get-ChildItem -Path $dirPath -Filter '*Landing*.md' | Select-Object -First 1
        if (-not $landing) { return }

        $blocks += [pscustomobject]@{
            Number      = $idx.ToString('00')
            Name        = $name
            Path        = $dirPath
            LandingFile = $landing
            LandingBase = $landing.BaseName
            Description = if ($descriptions.ContainsKey($name)) { $descriptions[$name] } else { "Catatan klinis sistem $name." }
        }
        $idx++
    }
    return $blocks
}

function Resolve-SessionTest {
    param([System.IO.FileInfo]$MaterialFile, [array]$TestFiles)
    $numMatch = [regex]::Match($MaterialFile.BaseName, '(\d+)\s*$')
    if ($numMatch.Success) {
        $num = $numMatch.Groups[1].Value
        $exact = $TestFiles | Where-Object { $_.BaseName -match "(?i)pre-postest\s*$num\b" } | Select-Object -First 1
        if ($exact) { return $exact }
    }
    return $null
}

function Get-LearningSessions {
    param([pscustomobject]$Block)

    $matFiles = @()
    foreach ($sub in 'Dasar', 'Pato') {
        $subPath = Join-Path $Block.Path $sub
        if (Test-Path $subPath) {
            $matFiles += Get-ChildItem -Path $subPath -Filter '*.md' |
                Where-Object { $_.Name -notmatch '(?i)pre-postest' } |
                Sort-Object { [regex]::Replace($_.BaseName, '\d+', { $args[0].Value.PadLeft(4, '0') }) }
        }
    }

    $testFiles = @(Get-ChildItem -Path $Block.Path -Recurse -Filter '*Pre-postest*.md' |
        Sort-Object { [regex]::Replace($_.BaseName, '\d+', { $args[0].Value.PadLeft(4, '0') }) })

    $sessions = @()
    for ($i = 0; $i -lt $matFiles.Count; $i++) {
        $mat  = $matFiles[$i]
        $test = Resolve-SessionTest -MaterialFile $mat -TestFiles $testFiles
        $cat  = if ($mat.DirectoryName -match 'Pato$') { 'Patologi' } else { 'Dasar' }

        $sessions += [pscustomobject]@{
            SessionNum  = $i + 1
            TotalCount  = $matFiles.Count
            Title       = $mat.BaseName
            Category    = $cat
            Material    = $mat
            Test        = $test
            HasTest     = ($null -ne $test)
            EntryTarget = if ($test) { $test.BaseName } else { $mat.BaseName }
        }
    }
    return $sessions
}

function Update-SessionNavigation {
    param([pscustomobject]$Block, [array]$Sessions)

    for ($i = 0; $i -lt $Sessions.Count; $i++) {
        $s       = $Sessions[$i]
        $nextSes = if (($i + 1) -lt $Sessions.Count) { $Sessions[$i + 1] } else { $null }

        $nextRoute = if ($nextSes) {
            "Lanjut ke [[$($nextSes.EntryTarget)|Sesi $($nextSes.SessionNum.ToString('00')) $EmDash $($nextSes.Title) $Arrow]]"
        } else {
            "Sesi terakhir di blok ini. Kembali ke [[$($Block.LandingBase)|Blok $($Block.Name) $Arrow]]"
        }

        if ($s.HasTest) {
            $testNav = "$NavBegin`n`n---`n`n> [!info] Sesi $($s.SessionNum.ToString('00')) / $($s.TotalCount.ToString('00')) $MidDot Blok $($Block.Name)`n> **Langkah:** ``01 PRETEST`` $Arrow ``02 MATERI`` $Arrow ``03 POSTTEST```n>`n> - **Baru mulai sesi (Pretest):** Setelah menjawab soal di atas, lanjut ke [[$($s.Material.BaseName)|Materi: $($s.Material.BaseName) $Arrow]]`n> - **Selesai evaluasi akhir (Posttest):** $nextRoute`n> - [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]`n`n$NavEnd"
            $rawTest   = [System.IO.File]::ReadAllText($s.Test.FullName)
            $cleanTest = Remove-ExistingNav -Raw $rawTest
            Write-Utf8File -Path $s.Test.FullName -Content ($cleanTest + "`n`n" + $testNav)

            $matNav = "$NavBegin`n`n---`n`n> [!info] Sesi $($s.SessionNum.ToString('00')) / $($s.TotalCount.ToString('00')) $MidDot Blok $($Block.Name)`n> **Langkah:** ~~01 Pretest~~ $Arrow **``02 MATERI (SEDANG DIBACA)``** $Arrow ``03 POSTTEST```n>`n> - **Tahap berikutnya:** [[$($s.Test.BaseName)|Lanjut ke Posttest Sesi $($s.SessionNum.ToString('00')) $Arrow]]`n> - [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]`n`n$NavEnd"
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Remove-ExistingNav -Raw $rawMat
            Write-Utf8File -Path $s.Material.FullName -Content ($cleanMat + "`n`n" + $matNav)
        } else {
            $matOnlyNav = "$NavBegin`n`n---`n`n> [!info] Sesi $($s.SessionNum.ToString('00')) / $($s.TotalCount.ToString('00')) $MidDot Blok $($Block.Name)`n> **Langkah:** **``01 MATERI INTI``** *(Evaluasi pretest/posttest belum tersedia pada sesi ini)*`n>`n> - **Tahap berikutnya:** $nextRoute`n> - [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]`n`n$NavEnd"
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Remove-ExistingNav -Raw $rawMat
            Write-Utf8File -Path $s.Material.FullName -Content ($cleanMat + "`n`n" + $matOnlyNav)
        }
    }
}

function New-BlockLandingContent {
    param([pscustomobject]$Block, [array]$Sessions, [string]$ExistingRaw)

    $skdiMatch = [regex]::Match($ExistingRaw, '(?s)(## .*Target Kompetensi & Clinical Pearl.*)')
    $clinicalSection = if ($skdiMatch.Success) {
        ($skdiMatch.Value -replace '(?s)---\s*> \[!abstract\].*Progress Bar.*$', '').Trim()
    } else { '' }

    $firstTarget = if ($Sessions.Count -gt 0) { $Sessions[0].EntryTarget } else { 'index' }
    $brotySvg    = Get-BrotySvg -Size 46
    $css         = Get-SharedEditorialCss

    $sessionItems = @()
    foreach ($s in $Sessions) {
        $flowLabel = if ($s.HasTest) { "01 Pretest $Arrow 02 Materi $Arrow 03 Posttest" } else { "Materi Inti" }
        $ctaText   = if ($s.HasTest) { "Mulai sesi $Arrow" } else { "Baca materi $Arrow" }
        $sessionItems += "<a class='sj-session-row' href='$($s.EntryTarget)'>
  <div class='sj-session-left'>
    <span class='sj-session-idx'>$($s.SessionNum.ToString('00'))</span>
    <div>
      <div class='sj-session-title'>$($s.Title)</div>
      <div class='sj-session-sub'>$($s.Category) $MidDot $flowLabel</div>
    </div>
  </div>
  <span class='sj-session-cta'>$ctaText</span>
</a>"
    }

    $clinicalBlock = if ($clinicalSection) { "`n---`n`n$clinicalSection`n" } else { '' }

    return "---
title: Blok $($Block.Name) $EmDash sjawatdh.
description: $($Block.Description)
showToc: false
showLinkPreviews: false
---

$css

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
      <span class='sj-eyebrow'>BLOK $($Block.Number) $MidDot $($Sessions.Count) SESI</span>
      <h1 class='sj-hero-title'>$($Block.Name)</h1>
      <p class='sj-hero-desc'>$($Block.Description)</p>
      <a class='sj-cta-primary' href='$firstTarget'>Mulai dari Sesi 01 $Arrow</a>
    </div>

    <div class='sj-broty-card'>
      <div class='sj-broty-header'>
        $brotySvg
        <span class='sj-broty-name'>broty // catatan sesi</span>
      </div>
      <p class='sj-broty-text'>Kerjakan pretest dulu buat lihat bagian mana yang masih kosong, lanjut baca materi pelan-pelan, lalu tutup dengan posttest.</p>
    </div>
  </section>

  <div class='sj-section-head'>
    <h2 class='sj-section-title'>Daftar Sesi</h2>
    <span class='sj-section-meta'>$($Sessions.Count) modul</span>
  </div>

  <div class='sj-session-list'>
$($sessionItems -join "`n")
  </div>
$clinicalBlock
  <footer class='sj-footer'>
    <span><a href='./'>$LeftArrow Kembali ke semua blok</a></span>
    <span>sjawatdh. $MidDot personal medical study space</span>
  </footer>
</div>"
}

function New-HomepageContent {
    param([array]$BlockItems)

    $totalSessions = ($BlockItems | Measure-Object -Property SessionCount -Sum).Sum
    $brotySvg      = Get-BrotySvg -Size 50
    $css           = Get-SharedEditorialCss
    $tiles         = @()

    foreach ($item in $BlockItems) {
        $b = $item.Block
        $tiles += "<a class='sj-block-tile' href='$($b.LandingBase)'>
  <div>
    <div class='sj-tile-top'>
      <span class='sj-tile-num'>$($b.Number)</span>
      <span class='sj-tile-count'>$($item.SessionCount) sesi</span>
    </div>
    <div class='sj-tile-name'>$($b.Name)</div>
    <div class='sj-tile-desc'>$($b.Description)</div>
  </div>
  <span class='sj-tile-action'>Buka blok $Arrow</span>
</a>"
    }

    return "---
title: sjawatdh. $EmDash catatan belajar kedokteran
description: Tempat buat belajar blok tanpa ribet. Materi, pretest, dan posttest dari dasar sampai klinis.
showToc: false
showLinkPreviews: false
---

$css

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
      <span class='sj-eyebrow'>$($BlockItems.Count) BLOK $MidDot $totalSessions SESI BELAJAR</span>
      <h1 class='sj-hero-title'>belajar blok, pelan-pelan sampai paham.</h1>
      <p class='sj-hero-desc'>Catatan belajar kedokteran dari dasar sampai klinis. Lengkap dengan pretest dan posttest buat nemenin kamu ngejar pemahaman tanpa ribet.</p>
      <a class='sj-cta-primary' href='#blok'>Pilih blok hari ini $Arrow</a>
    </div>

    <div class='sj-broty-card'>
      <div class='sj-broty-header'>
        $brotySvg
        <span class='sj-broty-name'>broty // study companion</span>
      </div>
      <p class='sj-broty-text'>Hai! Mau mulai dari blok mana hari ini? Tiap sesi udah disusun berurutan dari pretest, materi, sampai posttest biar kamu tinggal ngikutin alurnya.</p>
    </div>
  </section>

  <div id='blok' class='sj-section-head'>
    <h2 class='sj-section-title'>Mau belajar blok apa hari ini?</h2>
    <span class='sj-section-meta'>$($BlockItems.Count) sistem organ</span>
  </div>

  <div class='sj-block-grid'>
$($tiles -join "`n")
  </div>

  <footer class='sj-footer'>
    <span>sjawatdh. $MidDot disarikan dari Harrison's &amp; referensi klinis untuk studi personal.</span>
    <a href='Untuk%20Sjawatdh%20(Landing)'>Tentang &amp; Manifesto $Arrow</a>
  </footer>
</div>"
}

function Test-InternalLinks {
    param([string]$WebpageRoot)

    $allFiles = Get-ChildItem -Path $WebpageRoot -Recurse -Filter '*.md'
    $validTargets = @{}
    foreach ($f in $allFiles) {
        $validTargets[$f.BaseName.ToLower()] = $true
    }

    $broken = @()
    foreach ($f in $allFiles) {
        $content = [System.IO.File]::ReadAllText($f.FullName)
        $links = [regex]::Matches($content, '(?<!!)\[\[([^\|\]#]+)')
        foreach ($m in $links) {
            $target = $m.Groups[1].Value.Trim().TrimEnd('\')
            if (-not $validTargets.ContainsKey($target.ToLower())) {
                $broken += "$($f.Name) -> [[$target]]"
            }
        }
    }
    return $broken
}

# === EKSEKUSI UTAMA ===
$webpageRoot  = 'E:\sayabacalagi\Webpage'
$blocks       = @(Get-BlockStructure -WebpageRoot $webpageRoot)
$blockSummary = @()

foreach ($b in $blocks) {
    $sessions    = @(Get-LearningSessions -Block $b)
    $existingRaw = [System.IO.File]::ReadAllText($b.LandingFile.FullName)

    Update-SessionNavigation -Block $b -Sessions $sessions
    $landingMd = New-BlockLandingContent -Block $b -Sessions $sessions -ExistingRaw $existingRaw
    Write-Utf8File -Path $b.LandingFile.FullName -Content $landingMd

    $blockSummary += [pscustomobject]@{
        Block        = $b
        SessionCount = $sessions.Count
    }
    Write-Host "[OK] [$($b.Number)] $($b.Name): $($sessions.Count) sesi diperbarui" -ForegroundColor Green
}

$homepageMd = New-HomepageContent -BlockItems $blockSummary
Write-Utf8File -Path (Join-Path $webpageRoot 'index.md') -Content $homepageMd
Write-Host "[OK] Homepage Webpage\index.md (Editorial Digital Study Space) berhasil diperbarui" -ForegroundColor Green

$brokenLinks = @(Test-InternalLinks -WebpageRoot $webpageRoot)
if ($brokenLinks.Count -gt 0) {
    Write-Warning "Ditemukan $($brokenLinks.Count) tautan internal yang perlu diperiksa:"
    $brokenLinks | ForEach-Object { Write-Warning " - $_" }
} else {
    Write-Host "[OK] Validasi tautan selesai: 0 tautan rusak di seluruh Webpage/" -ForegroundColor Cyan
}

Write-Host "`n--- Status Git (siap direview sebelum commit) ---" -ForegroundColor Yellow
git status -sb