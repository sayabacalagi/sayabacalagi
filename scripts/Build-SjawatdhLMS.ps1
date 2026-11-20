Set-StrictMode -Version Latest;
$ErrorActionPreference = 'Stop';

$Utf8NoBom   = New-Object System.Text.UTF8Encoding $false;
$NavBegin    = '<!-- SJAWATDH-NAV:BEGIN -->';
$NavEnd      = '<!-- SJAWATDH-NAV:END -->';
$HeadBegin   = '<!-- SJAWATDH-HEAD:BEGIN -->';
$HeadEnd     = '<!-- SJAWATDH-HEAD:END -->';
$Arrow       = [string][char]0x2192;
$LeftArrow   = [string][char]0x2190;
$EmDash      = [string][char]0x2014;
$EnDash      = [string][char]0x2013;
$MidDot      = [string][char]0x00B7;
$BlackSquare = [string][char]0x25A0;

function Write-Utf8File {
    param([string]$Path, [string]$Content)
    [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom)
}

function Repair-LanguageAndTypography {
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

    $t = [regex]::Replace($t, '([a-z]{3,})-\s+([a-z]{3,})', '$1$2')
    $t = [regex]::Replace($t, '[ \t]+([,\.;:\?\!])', '$1')
    $t = [regex]::Replace($t, '(?i)\bpre-?post\s*test\b', 'Pretest & Posttest')
    $t = [regex]::Replace($t, '(?i)\bpre-?test\b', 'Pretest')
    $t = [regex]::Replace($t, '(?i)\bpost-?test\b', 'Posttest')

    return $t
}

function Remove-GeneratedWrappers {
    param([string]$Raw)
    $c = $Raw
    $c = [regex]::Replace($c, '(?s)^---.*?---\s*', '')
    $c = [regex]::Replace($c, "(?s)^$([regex]::Escape($HeadBegin)).*?$([regex]::Escape($HeadEnd))\r?\n*", '')
    $c = [regex]::Replace($c, "(?s)\r?\n?$([regex]::Escape($NavBegin)).*?$([regex]::Escape($NavEnd))\r?\n?", '')
    $c = [regex]::Replace($c, '(?s)\r?\n?<!-- LMS-NAV:BEGIN -->.*?<!-- LMS-NAV:END -->\r?\n?', '')
    $c = [regex]::Replace($c, '(?s)\r?\n---\r?\n> \[!info\] \*\*Navigasi Sesi LMS\*\*.*$', '')
    $c = [regex]::Replace($c, '(?m)^==NILAI PRETEST[^\r\n]*\r?\n*', '')
    $c = [regex]::Replace($c, '(?s)<details class=[''"]sj-spoiler[''"]>\s*<summary>.*?</summary>\s*(.*?)\s*</details>', '$1')
    return $c.Trim()
}

function Format-HeadingCase {
    param([string]$RawHeading)
    $clean = $RawHeading.Trim()
    if ($clean -cmatch '^[A-Z0-9\s,\-\(\)\/]+$' -and $clean.Length -gt 4) {
        $textInfo = (Get-Culture).TextInfo
        $title = $textInfo.ToTitleCase($clean.ToLower())
        foreach ($abbr in @('Dna', 'Rna', 'Atp', 'Camp', 'Igf', 'Tsh', 'Acth', 'Fsh', 'Lh', 'Gh', 'Adh', 'Pth', 'Hiv', 'Cns', 'Gi', 'Cvd', 'Ecg', 'Mri', 'Ct', 'Usg', 'Who', 'Skdi')) {
            $title = [regex]::Replace($title, "\b$abbr\b", $abbr.ToUpper())
        }
        foreach ($prep in @('Of', 'And', 'The', 'In', 'To', 'For', 'With', 'On', 'At', 'By', 'Dan', 'Di', 'Ke', 'Dari', 'Pada', 'Untuk', 'Dengan', 'Yang')) {
            $title = [regex]::Replace($title, "(?<=\s)$prep(?=\s)", $prep.ToLower())
        }
        return $title
    }
    return $clean
}

function Split-LongParagraphs {
    param([string]$Paragraph)
    if ($Paragraph.Length -lt 460) { return $Paragraph }
    if ($Paragraph -match '^(#|>|\||-|\*|\d+\.|```|<)') { return $Paragraph }

    $abbrPattern = '(?<!\b(?:Dr\vert{}Mr\vert{}Mrs\vert{}Ms\vert{}Prof\vert{}Fig\vert{}Figs\vert{}Tab\vert{}Chap\vert{}Chaps\vert{}vs\vert{}approx\vert{}ca\vert{}cf\vert{}al\vert{}e\.g\vert{}i\.e\vert{}i\.v\vert{}i\.m\vert{}s\.c\vert{}p\.o\vert{}b\.i\.d\vert{}t\.i\.d\vert{}q\.d\vert{}sp\vert{}spp))'$sentences = [regex]::Split($Paragraph, "(?<=$abbrPattern\.)\s+(?=[A-Z0-9`"(\[])")
    if ($sentences.Count -le 3) { return$Paragraph }

    $chunks = @()
    for ($i = 0; $i -lt$sentences.Count; $i += 3) {$end = [Math]::Min($i + 2,$sentences.Count - 1)
        $chunks += ($sentences[$i..$end] -join ' ')
    }
    return ($chunks -join "`n`n")
}

function Add-UpToDateBoldLeadIns {
    param([string]$Paragraph)
    if ($Paragraph -match '^(#|>|\||-|\*|\d+\.|```|<|\*\*)') { return $Paragraph }
    return [regex]::Replace($Paragraph, '^([A-Z][A-Za-z0-9\s\-\(\)]{3,42})(\s+(?:—|–|is defined as|refers to|adalah|merupakan)\b)', '**$1**$2')
}

function Format-MaterialBody {
    param([string]$Body)
    $clean = Repair-LanguageAndTypography -Text $Body

    $sqRegex = [regex]'\s*\u25A0\s*([A-Z][A-Z0-9\s,\-\(\)\/]{3,70})(?=\s+[A-Z][a-z])'
    $clean = $sqRegex.Replace($clean, {
        param($m)
        $headingTitle = Format-HeadingCase -RawHeading $m.Groups[1].Value
        return "`n`n## $headingTitle`n`n"
    })

    $clean = [regex]::Replace($clean, '\s+(TABLE\s+\d+[\-\.]\d+[^\r\n]{0,100})', ("`n`n> **Referensi Tabel:** " + '$1' + "`n`n"))
    $clean = [regex]::Replace($clean, '\s+(FIGURE\s+\d+[\-\.]\d+[^\r\n]{0,100})', ("`n`n> **Referensi Gambar:** " + '$1' + "`n`n"))
    $clean = [regex]::Replace($clean, '\s+(Abbreviations:\s+)', "`n`n> **Keterangan Singkatan:** ")

    $blocks = [regex]::Split($clean, '\r?\n\s*\r?\n')
    $formattedBlocks = foreach ($blk in $blocks) {
        $trimmed = $blk.Trim()
        if ($trimmed) {
            $splitText = Split-LongParagraphs -Paragraph $trimmed
            $subParas = [regex]::Split($splitText, '\r?\n\s*\r?\n')
            $styledSubs = foreach ($sp in $subParas) { Add-UpToDateBoldLeadIns -Paragraph $sp.Trim() }
            ($styledSubs -join "`n`n")
        }
    }

    return ($formattedBlocks -join "`n`n").Trim()
}

function Get-EstimatedReadingMinutes {
    param([string]$Text)
    $words = ([regex]::Matches($Text, '\b\w+\b')).Count
    return [Math]::Max(3, [Math]::Ceiling($words / 210))
}

function Format-TestBodyWithSpoiler {
    param([string]$Body)
    $clean = Repair-LanguageAndTypography -Text $Body
    $clean = [regex]::Replace($clean, '(?<=[^\r\n])\s+([A-E]\.\s+)', "`n   `$1")

    $splitMatch = [regex]::Match($clean, '(?im)^(#{1,4}\s*|\*\*)?Kunci\s*Jawaban\b.*$')
    if (-not $splitMatch.Success) { return $clean }

    $idx = $splitMatch.Index
    $questionsPart = $clean.Substring(0, $idx).Trim()
    $answersPart   = $clean.Substring($idx).Trim()

    return "$questionsPart`n`n---`n`n<details>`n<summary><strong>Buka Kunci Jawaban &amp; Pembahasan</strong></summary>`n`n$answersPart`n`n</details>"
}

function Get-BlockStructure {
    param([string]$WebpageRoot)

    $blocks = @()
    $idx = 1
    Get-ChildItem -Path $WebpageRoot -Directory | Sort-Object Name | ForEach-Object {
        $landing = Get-ChildItem -Path $_.FullName -Filter '*Landing*.md' | Select-Object -First 1
        if (-not $landing) { return }
        $name = $_.Name
        $blocks += [pscustomobject]@{
            Number      = $idx.ToString('00')
            Name        = $name
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
    if ($m.Success) { return (Repair-LanguageAndTypography -Text $m.Groups[1].Value.Trim()) }
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
        $cat       = if ($mat.DirectoryName -match 'Pato$') { 'Patologi & Klinis' } else { 'Ilmu Dasar' }
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

        $nextLink = if ($nextSes) {
            "[[$($nextSes.EntryTarget)|Sesi Berikutnya $Arrow]]"
        } else {
            "[[$($Block.LandingBase)|Kembali ke Blok $Arrow]]"
        }

        if ($s.HasTest) {
            $rawTest     = [System.IO.File]::ReadAllText($s.Test.FullName)
            $cleanTest   = Remove-GeneratedWrappers -Raw $rawTest
            $spoilerTest = Format-TestBodyWithSpoiler -Body $cleanTest

            $testContent = "---
title: `"Pretest & Posttest $EmDash $($s.DisplayTitle)`"
showToc: false
showLinkPreviews: false
---

[[index|sjawatdh.]] / [[$($Block.LandingBase)|$($Block.Name)]] / **Sesi $sesCode**

# Evaluasi Awal & Akhir Sesi

| Topik Bahasan | Jumlah Butir | Fungsi Evaluasi |
| :--- | :--- | :--- |
| **$($s.DisplayTitle)** | $($s.QuestionCount) Soal Pilihan Ganda | Pretest & Posttest |

> **Petunjuk Pengerjaan:** Kerjakan seluruh soal secara mandiri sebelum membaca materi inti untuk mengukur pemahaman awal. Setelah selesai mempelajari materi inti, buka kembali halaman ini sebagai **Posttest**.

---

$spoilerTest

$NavBegin

---

**Navigasi Sesi:** [[$($s.Material.BaseName)|Lanjut ke Materi Inti $Arrow]] $MidDot $nextLink $MidDot [[$($Block.LandingBase)|Daftar Sesi]]

$NavEnd"

            Write-Utf8File -Path $s.Test.FullName -Content $testContent

            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Format-MaterialBody -Body (Remove-GeneratedWrappers -Raw $rawMat)
            $readMins = Get-EstimatedReadingMinutes -Text $cleanMat

            $matContent = "---
title: `"$($s.DisplayTitle) $EmDash $($Block.Name)`"
showToc: true
showLinkPreviews: false
---

[[index|sjawatdh.]] / [[$($Block.LandingBase)|$($Block.Name)]] / **Sesi $sesCode**

# $($s.DisplayTitle)

| Blok Sistem | Kategori | Urutan Sesi | Estimasi Baca |
| :--- | :--- | :--- | :--- |
| **$($Block.Name)** | $($s.Category) | Sesi $sesCode dari $($s.TotalCount.ToString('00')) | ~$readMins menit |

> **Panduan Fokus Baca (UpToDate Style):** Gunakan daftar isi (*Topic Outline*) di sisi halaman untuk melompat antar-subbab, perhatikan istilah kunci yang dicetak tebal di awal paragraf, lalu uji pemahaman melalui **Posttest** di akhir sesi.

---

$cleanMat

$NavBegin

---

**Navigasi Sesi:** [[$($s.Test.BaseName)|$LeftArrow Pretest]] $MidDot **Materi Inti** $MidDot [[$($s.Test.BaseName)|Lanjut Posttest $Arrow]] $MidDot $nextLink

$NavEnd"

            Write-Utf8File -Path $s.Material.FullName -Content $matContent
        } else {
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Format-MaterialBody -Body (Remove-GeneratedWrappers -Raw $rawMat)
            $readMins = Get-EstimatedReadingMinutes -Text $cleanMat

            $matContent = "---
title: `"$($s.DisplayTitle) $EmDash $($Block.Name)`"
showToc: true
showLinkPreviews: false
---

[[index|sjawatdh.]] / [[$($Block.LandingBase)|$($Block.Name)]] / **Sesi $sesCode**

# $($s.DisplayTitle)

| Blok Sistem | Kategori | Urutan Sesi | Estimasi Baca |
| :--- | :--- | :--- | :--- |
| **$($Block.Name)** | $($s.Category) | Sesi $sesCode dari $($s.TotalCount.ToString('00')) | ~$readMins menit |

---

$cleanMat

$NavBegin

---

**Navigasi Sesi:** [[$($Block.LandingBase)|$LeftArrow Kembali ke Blok]] $MidDot $nextLink

$NavEnd"

            Write-Utf8File -Path $s.Material.FullName -Content $matContent
        }
    }
}

function New-BlockLandingContent {
    param([pscustomobject]$Block, [array]$Sessions, [string]$ExistingRaw)

    $skdiMatch = [regex]::Match($ExistingRaw, '(?s)(## .*Target Kompetensi & Clinical Pearl.*)')
    $clinicalSection = if ($skdiMatch.Success) {
        $rawClin = ($skdiMatch.Value -replace '(?s)---\s*> \[!abstract\].*Progress Bar.*$', '').Trim()
        Repair-LanguageAndTypography -Text $rawClin
    } else { '' }

    $tableRows = @()
    foreach ($s in $Sessions) {
        $sesCode = $s.SessionNum.ToString('00')
        $evalCol = if ($s.HasTest) { "$($s.QuestionCount) soal (Pre/Posttest)" } else { "Materi inti" }
        $matLink = "[[$($s.Material.BaseName)|Baca Materi]]"
        $entryLink = "[[$($s.EntryTarget)|$($s.DisplayTitle)]]"
        $tableRows += "| **$sesCode** | $entryLink | $($s.Category) | $evalCol | $matLink |"
    }

    $orientPart = if ($clinicalSection) {
        "`n---`n`n$clinicalSection`n"
    } else { '' }

    return "---
title: `"$($Block.Name) $EmDash sjawatdh.`"
showToc: true
showLinkPreviews: false
---

[[index|sjawatdh.]] / **Blok $($Block.Number)**

# $($Block.Name)

| Kode Blok | Jumlah Sesi | Alur Belajar Standar |
| :--- | :--- | :--- |
| **Blok $($Block.Number)** | $($Sessions.Count) Sesi Terstruktur | Pretest $Arrow Materi Inti $Arrow Posttest |
$orientPart
---

## Daftar Sesi & Topik Klinis

| Sesi | Topik Bahasan (Mulai Evaluasi) | Kategori | Evaluasi | Akses Langsung |
| :--- | :--- | :--- | :--- | :--- |
$($tableRows -join "`n")

---

[[index|$LeftArrow Kembali ke Daftar Blok]] $MidDot [[Untuk Sjawatdh (Landing)|Tentang Ruang Belajar]]"
}

function New-HomepageContent {
    param([array]$BlockItems)

    $totalSessions = ($BlockItems | Measure-Object -Property SessionCount -Sum).Sum
    $rows = @()

    foreach ($item in $BlockItems) {
        $b = $item.Block
        $rows += "| **$($b.Number)** | [[$($b.LandingBase)|$($b.Name)]] | $($item.SessionCount) sesi terstruktur |"
    }

    return "---
title: `"sjawatdh. $EmDash Belajar Blok, Pelan-pelan Sampai Paham`"
description: `"Materi inti dan evaluasi terstruktur untuk pembelajaran kedokteran.`"
showToc: false
showLinkPreviews: false
---

# sjawatdh.
**belajar blok, pelan-pelan sampai paham.**

Materi inti dan evaluasi terstruktur untuk pembelajaran kedokteran (*Pretest $Arrow Materi Inti $Arrow Posttest*).

> **Hai, aku Broty.** Mau mulai belajar blok sistem organ yang mana hari ini?

---

## Pilih Blok Sistem Organ ($($BlockItems.Count) Blok $MidDot $totalSessions Sesi)

| No | Blok Sistem Organ | Cakupan Materi |
| :--- | :--- | :--- |
$($rows -join "`n")

---

**sjawatdh.** $MidDot Catatan belajar kedokteran $MidDot [[Untuk Sjawatdh (Landing)|Tentang ruang belajar ini $Arrow]]"
}

function Update-AboutPage {
    param([string]$WebpageRoot)
    $aboutPath = Join-Path $WebpageRoot 'Untuk Sjawatdh (Landing).md'
    if (-not (Test-Path $aboutPath)) { return }

    $raw = Remove-GeneratedWrappers -Raw ([System.IO.File]::ReadAllText($aboutPath))
    $bodyOnly = Repair-LanguageAndTypography -Text $raw

    $content = "---
title: `"Tentang $EmDash sjawatdh.`"
showToc: false
showLinkPreviews: false
---

[[index|sjawatdh.]] / **Tentang**

$bodyOnly

---

[[index|$LeftArrow Kembali ke Daftar Blok]]"

    Write-Utf8File -Path $aboutPath -Content $content
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
$webpageRoot  = 'E:\sayabacalagi\Webpage';
$blocks       = @(Get-BlockStructure -WebpageRoot $webpageRoot);
$blockSummary = @();

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
    Write-Host "[OK] [$($b.Number)] $($b.Name): $($sessions.Count) sesi diperbarui (UpToDate format + MDX-safe)" -ForegroundColor Green
}

Update-AboutPage -WebpageRoot $webpageRoot;
$homepageMd = New-HomepageContent -BlockItems $blockSummary;
Write-Utf8File -Path (Join-Path $webpageRoot 'index.md') -Content $homepageMd;
Write-Host "[OK] Homepage & Halaman Tentang diperbarui" -ForegroundColor Green;

$brokenLinks = @(Test-InternalLinks -WebpageRoot $webpageRoot);
if ($brokenLinks.Count -gt 0) {
    Write-Warning "Ditemukan $($brokenLinks.Count) tautan internal yang perlu diperiksa:"
    $brokenLinks | ForEach-Object { Write-Warning " - $_" }
} else {
    Write-Host "[OK] Validasi tautan selesai: 0 tautan rusak di seluruh Webpage/" -ForegroundColor Cyan
}