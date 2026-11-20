Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Utf8NoBom   = New-Object System.Text.UTF8Encoding $false
$NavBegin    = '<!-- SJAWATDH-NAV:BEGIN -->'
$NavEnd      = '<!-- SJAWATDH-NAV:END -->'
$HeadBegin   = '<!-- SJAWATDH-HEAD:BEGIN -->'
$HeadEnd     = '<!-- SJAWATDH-HEAD:END -->'
$Arrow       = [string][char]0x2192
$LeftArrow   = [string][char]0x2190
$DownArrow   = [string][char]0x2193
$EmDash      = [string][char]0x2014
$EnDash      = [string][char]0x2013
$MidDot      = [string][char]0x00B7
$BlackSquare = [string][char]0x25A0

function Write-Utf8File {
    param([string]$Path, [string]$Content)
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Repair-MojibakeText {
    param([string]$Text)
    $t = $Text
    $t = [regex]::Replace($t, '\u00E2\u20AC\u201D', $EmDash)
    $t = [regex]::Replace($t, '\u00E2\u20AC\u201C', $EnDash)
    $t = [regex]::Replace($t, '\u00E2\u20AC\u00A6', '...')
    $t = [regex]::Replace($t, '\u00E2\u20AC\u0153', '"')
    $t = [regex]::Replace($t, '\u00E2\u20AC\u009D', '"')
    $t = [regex]::Replace($t, '\u00E2\u20AC\u2122', "'")
    $t = [regex]::Replace($t, '\u00E2\u20AC\u02DC', "'")
    $t = [regex]::Replace($t, '\u00E2\u2030\u00A5', ([string][char]0x2265))
    $t = [regex]::Replace($t, '\u00E2\u2030\u00A4', ([string][char]0x2264))
    $t = [regex]::Replace($t, '\u00E2\u2013\u00A0', $BlackSquare)
    $t = [regex]::Replace($t, '\u00CE\u00B1', ([string][char]0x03B1))
    $t = [regex]::Replace($t, '\u00CE\u00B2', ([string][char]0x03B2))
    $t = [regex]::Replace($t, '\u00CE\u00B3', ([string][char]0x03B3))
    $t = [regex]::Replace($t, '\u00C2[\u00A0 ]', ' ')
    return $t
}

function Remove-GeneratedWrappers {
    param([string]$Raw)
    $c = $Raw
    $c = [regex]::Replace($c, "(?s)^$([regex]::Escape($HeadBegin)).*?$([regex]::Escape($HeadEnd))\r?\n*", '')
    $c = [regex]::Replace($c, "(?s)\r?\n?$([regex]::Escape($NavBegin)).*?$([regex]::Escape($NavEnd))\r?\n?", '')
    $c = [regex]::Replace($c, '(?s)\r?\n?<!-- LMS-NAV:BEGIN -->.*?<!-- LMS-NAV:END -->\r?\n?', '')
    $c = [regex]::Replace($c, '(?s)\r?\n---\r?\n> \[!info\] \*\*Navigasi Sesi LMS\*\*.*$', '')
    $c = [regex]::Replace($c, '(?m)^==NILAI PRETEST[^\r\n]*\r?\n*', '')
    return $c.Trim()
}

function Format-MaterialBody {
    param([string]$Body)
    $clean = Repair-MojibakeText -Text $Body
    $pattern = '\s*\u25A0\s*([A-Z][A-Z0-9\s,\-\(\)\/]{3,65})(?=\s+[A-Z][a-z])'
    $replacement = "`n`n## " + '$1' + "`n`n"
    $clean = [regex]::Replace($clean, $pattern, $replacement)
    return $clean.Trim()
}

function Get-SharedCss {
    return "<style>
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
</style>"
}

function Get-BrotySvg {
    return "<svg width='44' height='44' viewBox='0 0 100 100' aria-hidden='true' style='flex-shrink:0;'>
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
    $blocks = @()
    $idx = 1
    Get-ChildItem -Path $WebpageRoot -Directory | Sort-Object Name | ForEach-Object {
        $landing = Get-ChildItem -Path $_.FullName -Filter '*Landing*.md' | Select-Object -First 1
        if (-not $landing) { return }
        $blocks += [pscustomobject]@{
            Number      = $idx.ToString('00')
            Name        = $_.Name
            Path        = $_.FullName
            LandingFile = $landing
            LandingBase = $landing.BaseName
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

function Get-ChapterTitleFromTest {
    param([System.IO.FileInfo]$TestFile, [string]$FallbackTitle)
    if (-not $TestFile) { return $FallbackTitle }
    $raw = [System.IO.File]::ReadAllText($TestFile.FullName)
    $m = [regex]::Match($raw, 'berdasarkan bab \*\*([^*]+)\*\*')
    if ($m.Success) { return $m.Groups[1].Value.Trim() }
    return $FallbackTitle
}

function Get-QuestionCountFromTest {
    param([System.IO.FileInfo]$TestFile)
    if (-not $TestFile) { return 0 }
    $raw   = [System.IO.File]::ReadAllText($TestFile.FullName)
    $qPart = ($raw -split '(?i)Kunci\s*Jawaban')[0]
    $qNums = [regex]::Matches($qPart, '(?m)^\d+\.\s+')
    return $qNums.Count
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
        $mat       = $matFiles[$i]
        $test      = Resolve-SessionTest -MaterialFile $mat -TestFiles $testFiles
        $cat       = if ($mat.DirectoryName -match 'Pato$') { 'Patologi' } else { 'Dasar' }
        $chapTitle = Get-ChapterTitleFromTest -TestFile $test -FallbackTitle $mat.BaseName
        $qCount    = Get-QuestionCountFromTest -TestFile $test

        $sessions += [pscustomobject]@{
            SessionNum    = $i + 1
            TotalCount    = $matFiles.Count
            FileTitle     = $mat.BaseName
            DisplayTitle  = $chapTitle
            QuestionCount = $qCount
            Category      = $cat
            Material      = $mat
            Test          = $test
            HasTest       = ($null -ne $test)
            EntryTarget   = if ($test) { $test.BaseName } else { $mat.BaseName }
        }
    }
    return $sessions
}

function Update-SessionFiles {
    param([pscustomobject]$Block, [array]$Sessions)

    for ($i = 0; $i -lt $Sessions.Count; $i++) {
        $s       = $Sessions[$i]
        $nextSes = if (($i + 1) -lt $Sessions.Count) { $Sessions[$i + 1] } else { $null }
        $sesCode = $s.SessionNum.ToString('00')

        $nextText = if ($nextSes) {
            "[[$($nextSes.EntryTarget)|Sesi berikutnya $Arrow]]"
        } else {
            "[[$($Block.LandingBase)|Kembali ke blok]]"
        }

        if ($s.HasTest) {
            $rawTest   = [System.IO.File]::ReadAllText($s.Test.FullName)
            $cleanTest = Repair-MojibakeText -Text (Remove-GeneratedWrappers -Raw $rawTest)

            $testHeader = "$HeadBegin`n[[index|sjawatdh.]] / [[$($Block.LandingBase)|$($Block.Name)]] / Sesi $sesCode`n`n# Sebelum belajar`n**$($s.DisplayTitle)** $MidDot ``$($s.QuestionCount) soal`` $MidDot ``Pretest```n`nCoba kerjakan sebelum membaca materi. Jika sudah selesai membaca materi, kerjakan ulang sebagai **posttest**.`n`n---`n$HeadEnd"

            $testFooter = "$NavBegin`n`n---`n`n### Satu sesi selesai.`n**$($s.DisplayTitle)**`n`n- **Baru selesai pretest?** [[$($s.Material.BaseName)|Lanjut ke materi inti $Arrow]]`n- **Baru selesai posttest?** $nextText$MidDot [[$($Block.LandingBase)|Kembali ke blok]]`n`n$NavEnd"

            Write-Utf8File -Path $s.Test.FullName -Content ($testHeader + "`n`n" + $cleanTest + "`n`n" + $testFooter)

            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Format-MaterialBody -Body (Remove-GeneratedWrappers -Raw$rawMat)

            $matHeader = "$HeadBegin`n[[index\vert{}sjawatdh.]] / [[$($Block.LandingBase)\vert{}$($Block.Name)]] / Sesi $sesCode`n`n# $($s.DisplayTitle)`n``$($s.Category)`` $MidDot ``Sesi $sesCode dari $($s.TotalCount.ToString('00'))```n`n---`n$HeadEnd"

            $matFooter = "$NavBegin`n`n---`n`n[[$($s.Test.BaseName)|$LeftArrow Pretest]] $MidDot **Materi inti** $MidDot [[$($s.Test.BaseName)|Lanjut posttest $Arrow]]`n`n$NavEnd"

            Write-Utf8File -Path $s.Material.FullName -Content ($matHeader + "`n`n" + $cleanMat + "`n`n" + $matFooter)
        } else {
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Format-MaterialBody -Body (Remove-GeneratedWrappers -Raw $rawMat)

            $matHeader = "$HeadBegin`n[[index|sjawatdh.]] / [[$($Block.LandingBase)|$($Block.Name)]] / Sesi $sesCode`n`n# $($s.DisplayTitle)`n``$($s.Category)`` $MidDot ``Materi inti```n`n---`n$HeadEnd"

            $matFooter = "$NavBegin`n`n---`n`n**Materi inti** $MidDot $nextText $MidDot [[$($Block.LandingBase)|Kembali ke blok]]`n`n$NavEnd"

            Write-Utf8File -Path $s.Material.FullName -Content ($matHeader + "`n`n" + $cleanMat + "`n`n" + $matFooter)
        }
    }
}

function New-BlockLandingContent {
    param([pscustomobject]$Block, [array]$Sessions, [string]$ExistingRaw)

    $skdiMatch = [regex]::Match($ExistingRaw, '(?s)(## .*Target Kompetensi & Clinical Pearl.*)')
    $clinicalSection = if ($skdiMatch.Success) {
        ($skdiMatch.Value -replace '(?s)---\s*> \[!abstract\].*Progress Bar.*$', '').Trim()
    } else { '' }

    $css  = Get-SharedCss
    $rows = @()

    foreach ($s in $Sessions) {
        $sesCode  = $s.SessionNum.ToString('00')
        $subLabel = if ($s.DisplayTitle -ne $s.FileTitle) { "$($s.Category) $MidDot $($s.DisplayTitle)" } else { $s.Category }
        $rows += "<a class='sj-index-row' href='$($s.EntryTarget)'>
  <span class='sj-row-num'>$sesCode</span>
  <div>
    <div class='sj-row-title'>$($s.FileTitle)</div>
    <div class='sj-mono'>$subLabel</div>
  </div>
  <span class='sj-row-meta'>$(if ($s.HasTest) { "$($s.QuestionCount) soal" } else { "materi" })</span>
  <span class='sj-row-arrow'>$Arrow</span>
</a>"
    }

    $clinicalPart = if ($clinicalSection) { "`n---`n`n$clinicalSection`n" } else { '' }

    return "---
title: $($Block.Name) $EmDash sjawatdh.
showToc: false
showLinkPreviews: false
---

$css

<div class='sj-wrap'>
  <header class='sj-nav'>
    <a class='sj-logo' href='./'>sjawatdh.</a>
    <nav class='sj-nav-right'>
      <a href='./'>blok</a>
      <a href='Untuk%20Sjawatdh%20(Landing)'>tentang</a>
    </nav>
  </header>

  <div style='margin-bottom:2.25rem;'>
    <span class='sj-mono'>$($Block.Name.ToUpper()) $MidDot $($Block.Number)</span>
    <h1 class='sj-h1' style='margin-top:0.35rem !important;'>$($Block.Name)</h1>
    <span class='sj-mono'>$($Sessions.Count) sesi</span>
  </div>

  <div class='sj-index-list'>
$($rows -join "`n")
  </div>
$clinicalPart
  <footer class='sj-foot'>
    <a href='./'>$LeftArrow kembali ke blok</a>
    <span>sjawatdh.</span>
  </footer>
</div>"
}

function New-HomepageContent {
    param([array]$BlockItems)

    $totalSessions = ($BlockItems | Measure-Object -Property SessionCount -Sum).Sum
    $brotySvg      = Get-BrotySvg
    $css           = Get-SharedCss
    $rows          = @()

    foreach ($item in $BlockItems) {
        $b = $item.Block
        $rows += "<a class='sj-index-row' href='$($b.LandingBase)'>
  <span class='sj-row-num'>$($b.Number)</span>
  <span class='sj-row-title'>$($b.Name)</span>
  <span class='sj-row-meta'>$($item.SessionCount) sesi</span>
  <span class='sj-row-arrow'>$Arrow</span>
</a>"
    }

    return "---
title: sjawatdh.
description: belajar blok, pelan-pelan sampai paham.
showToc: false
showLinkPreviews: false
---

$css

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
      <a class='sj-btn' href='#blok'>mulai belajar $DownArrow</a>
    </div>

    <div class='sj-broty-note'>
      $brotySvg
      <p class='sj-broty-copy'><strong>hai, aku Broty.</strong><br>mau belajar apa hari ini?</p>
    </div>
  </section>

  <div id='blok' class='sj-index-head'>
    <h2 class='sj-h2'>pilih blok.</h2>
    <span class='sj-mono'>$($BlockItems.Count) blok $MidDot $totalSessions sesi</span>
  </div>

  <div class='sj-index-list'>
$($rows -join "`n")
  </div>

  <footer class='sj-foot'>
    <span>sjawatdh. $MidDot catatan belajar kedokteran</span>
    <a href='Untuk%20Sjawatdh%20(Landing)'>tentang ruang belajar ini $Arrow</a>
  </footer>
</div>"
}

function Test-InternalLinks {
    param([string]$WebpageRoot)
    $allFiles = Get-ChildItem -Path $WebpageRoot -Recurse -Filter '*.md'
    $validTargets = @{}
    foreach ($f in $allFiles) { $validTargets[$f.BaseName.ToLower()] = $true }

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

    Update-SessionFiles -Block $b -Sessions $sessions
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
Write-Host "[OK] Homepage Webpage\index.md diperbarui" -ForegroundColor Green

$brokenLinks = @(Test-InternalLinks -WebpageRoot $webpageRoot)
if ($brokenLinks.Count -gt 0) {
    Write-Warning "Ditemukan $($brokenLinks.Count) tautan internal yang perlu diperiksa:"
    $brokenLinks | ForEach-Object { Write-Warning " - $_" }
} else {
    Write-Host "[OK] Validasi tautan selesai: 0 tautan rusak di seluruh Webpage/" -ForegroundColor Cyan
}

Write-Host "`n--- Status Git ---" -ForegroundColor Yellow
git status -sb