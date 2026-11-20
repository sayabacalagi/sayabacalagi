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

function Get-FrontMatter {
    param([string]$Raw, [string]$Title, [string]$Description)
    $m = [regex]::Match($Raw, '(?s)^---\r?\n.*?\r?\n---')
    if ($m.Success) { return $m.Value }
    return "---`ntitle: $Title`ndescription: $Description`n---"
}

function Remove-ExistingNav {
    param([string]$Raw)
    $clean = [regex]::Replace($Raw, "(?s)\r?\n?$([regex]::Escape($NavBegin)).*?$([regex]::Escape($NavEnd))\r?\n?", '')
    $clean = [regex]::Replace($clean, '(?s)\r?\n?<!-- LMS-NAV:BEGIN -->.*?<!-- LMS-NAV:END -->\r?\n?', '')
    $clean = [regex]::Replace($clean, '(?s)\r?\n---\r?\n> \[!info\] \*\*Navigasi Sesi LMS\*\*.*$', '')
    return $clean.TrimEnd()
}

function Get-BlockStructure {
    param([string]$WebpageRoot)

    $descriptions = @{
        'Endokrin'         = 'Regulasi hormonal, aksis hipotalamus-hipofisis, dan gangguan metabolik.'
        'Gastrointestinal' = 'Pendekatan klinis saluran cerna, hepatobilier, dan pankreas.'
        'Hematoimmuno'     = 'Hematologi klinis, gangguan hemostasis, serta penyakit imunologi.'
        'Intergumen'       = 'Morfologi lesi kulit, dermatologi klinis, dan korelasi patologi.'
        'Kardiovaskular'   = 'Hemodinamika, iskemia miokard, aritmia, dan gagal jantung.'
        'Nefro'            = 'Fisiologi ginjal, keseimbangan cairan-elektrolit, dan saluran kemih.'
        'Neuro'            = 'Neuroanatomi fungsional, lokalisasi lesi, dan kegawatan neurologis.'
        'ObsGyn'           = 'Fisiologi kehamilan, komplikasi obstetri, dan kesehatan reproduksi.'
        'Pulmo'            = 'Mekanika respirasi, pola obstruktif-restriktif, dan kegawatan napas.'
    }

    $blocks = @()
    $idx = 1
    Get-ChildItem -Path $WebpageRoot -Directory | Sort-Object Name | ForEach-Object {
        $name    = $_.Name
        $dirPath = $_.FullName
        $landing = Get-ChildItem -Path $dirPath -Filter '*Landing*.md' | Select-Object -First 1
        if (-not $landing) {
            Write-Warning "Melewati blok '$name': file *Landing*.md tidak ditemukan."
            return
        }

        $blocks += [pscustomobject]@{
            Number      = $idx.ToString('00')
            Name        = $name
            Path        = $dirPath
            LandingFile = $landing
            LandingBase = $landing.BaseName
            Description = if ($descriptions.ContainsKey($name)) { $descriptions[$name] } else { "Modul pembelajaran klinis sistem $name." }
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

    $brotyMid = 'Materi selesai dibaca. Lanjutkan ke posttest untuk mengevaluasi pemahamanmu pada sesi ini.'

    for ($i = 0; $i -lt $Sessions.Count; $i++) {
        $s       = $Sessions[$i]
        $nextSes = if (($i + 1) -lt $Sessions.Count) { $Sessions[$i + 1] } else { $null }

        $nextRoute = if ($nextSes) {
            "Sesi berikutnya: [[$($nextSes.EntryTarget)|Sesi $($nextSes.SessionNum) $EmDash $($nextSes.Title) $Arrow]]"
        } else {
            "Seluruh sesi pada blok ini telah tercapai. Kembali ke [[$($Block.LandingBase)|Ringkasan Blok $($Block.Name) $Arrow]]"
        }

        if ($s.HasTest) {
            $testNav = @"
$NavBegin

---

> [!info] Navigasi Sesi $($s.SessionNum) dari $($s.TotalCount) $MidDot Blok $($Block.Name)
> **Alur Sesi:** ``01 PRETEST`` $Arrow ``02 MATERI`` $Arrow ``03 POSTTEST``
>
> - **Jika baru memulai sesi (Pretest):** Lanjutkan membaca materi setelah menyelesaikan soal di atas: [[$($s.Material.BaseName)|Buka Materi: $($s.Material.BaseName) $Arrow]]
> - **Jika baru menyelesaikan evaluasi akhir (Posttest):** $nextRoute
> - **Navigasi Blok:** [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]

$NavEnd
"@
            $rawTest   = [System.IO.File]::ReadAllText($s.Test.FullName)
            $cleanTest = Remove-ExistingNav -Raw $rawTest
            Write-Utf8File -Path $s.Test.FullName -Content ($cleanTest + "`n`n" + $testNav)

            $matNav = @"
$NavBegin

---

> [!info] Navigasi Sesi $($s.SessionNum) dari $($s.TotalCount) $MidDot Blok $($Block.Name)
> **Alur Sesi:** ~~01 Pretest~~ $Arrow **``02 MATERI (AKTIF)``** $Arrow ``03 POSTTEST``
>
> > *Broty: "$brotyMid"*
>
> - **Langkah Selanjutnya:** [[$($s.Test.BaseName)|Lanjut ke Posttest Sesi $($s.SessionNum) $Arrow]]
> - **Navigasi Blok:** [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]

$NavEnd
"@
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Remove-ExistingNav -Raw $rawMat
            Write-Utf8File -Path $s.Material.FullName -Content ($cleanMat + "`n`n" + $matNav)
        } else {
            $matOnlyNav = @"
$NavBegin

---

> [!info] Navigasi Sesi $($s.SessionNum) dari $($s.TotalCount) $MidDot Blok $($Block.Name)
> **Alur Sesi:** **``01 MATERI INTI (AKTIF)``** *(Evaluasi pretest/posttest belum tersedia untuk sesi ini)*
>
> - **Langkah Selanjutnya:** $nextRoute
> - **Navigasi Blok:** [[$($Block.LandingBase)|Daftar Sesi $($Block.Name)]] $MidDot [[index|Beranda]]

$NavEnd
"@
            $rawMat   = [System.IO.File]::ReadAllText($s.Material.FullName)
            $cleanMat = Remove-ExistingNav -Raw $rawMat
            Write-Utf8File -Path $s.Material.FullName -Content ($cleanMat + "`n`n" + $matOnlyNav)
        }
    }
}

function New-BlockLandingContent {
    param([pscustomobject]$Block, [array]$Sessions, [string]$ExistingRaw)

    $fm = Get-FrontMatter -Raw $ExistingRaw -Title "Blok $($Block.Name) $EmDash Sjawatdh" -Description $Block.Description

    $skdiMatch = [regex]::Match($ExistingRaw, '(?s)(## .*Target Kompetensi & Clinical Pearl.*)')
    $clinicalSection = if ($skdiMatch.Success) {
        ($skdiMatch.Value -replace '(?s)---\s*> \[!abstract\].*Progress Bar.*$', '').Trim()
    } else { '' }

    $firstTarget = if ($Sessions.Count -gt 0) { $Sessions[0].EntryTarget } else { 'index' }

    $sessionRows = @()
    foreach ($s in $Sessions) {
        $flowText = if ($s.HasTest) { "Pretest $Arrow Materi $Arrow Posttest" } else { 'Materi Inti' }
        $ctaLabel = if ($s.HasTest) { "Mulai Sesi $($s.SessionNum) $Arrow" } else { "Baca Materi $($s.SessionNum) $Arrow" }
        $sessionRows += "| $($s.SessionNum.ToString('00')) | **$($s.Title)** | $($s.Category) | $flowText | [[$($s.EntryTarget)\|$ctaLabel]] |"
    }

    $tableMd = if ($sessionRows.Count -gt 0) {
        "| Sesi | Topik Pembelajaran | Kategori | Alur | Aksi |`n| :---: | :--- | :---: | :--- | :---: |`n" + ($sessionRows -join "`n")
    } else {
        '> *Belum ada sesi yang terdaftar pada blok ini.*'
    }

    $clinicalBlock = if ($clinicalSection) { "`n---`n`n$clinicalSection`n" } else { '' }

    return @"
$fm

[[index|Beranda]] / [[$($Block.LandingBase)|Blok $($Block.Name)]]

# Blok $($Block.Number) $EmDash $($Block.Name)

$($Block.Description)

- **Jumlah Sesi:** $($Sessions.Count) sesi pembelajaran terstruktur
- **Alur Belajar:** ``01 Pretest`` $Arrow ``02 Materi`` $Arrow ``03 Posttest``
- **Akses Cepat:** [[$firstTarget|Mulai dari Sesi 01 $Arrow]]

---

> [!tip] Catatan Pendamping $EmDash Broty
> *"Selesaikan pretest terlebih dahulu untuk melihat gambaran awal pemahamanmu. Setelah itu, pelajari materi inti secara bertahap dan tutup dengan posttest."*

## Daftar Sesi Pembelajaran

$tableMd
$clinicalBlock
---

[[index|$LeftArrow Kembali ke Daftar Blok]] $MidDot [[Untuk Sjawatdh (Landing)|Tentang Sjawatdh]]
"@
}

function New-HomepageContent {
    param([array]$BlockItems)

    $totalSessions = ($BlockItems | Measure-Object -Property SessionCount -Sum).Sum
    $catalogRows   = @()

    foreach ($item in $BlockItems) {
        $b = $item.Block
        $sesLabel = "$($item.SessionCount) Sesi"
        $catalogRows += "| $($b.Number) | **[[$($b.LandingBase)\|$($b.Name)]]** | $($b.Description) | $sesLabel | [[$($b.LandingBase)\|Buka Blok $Arrow]] |"
    }

    return @"
---
title: Sjawatdh $EmDash Platform Pembelajaran Klinis
description: Ruang belajar kedokteran terstruktur untuk memahami ilmu dasar, patologi, dan penerapannya dalam praktik klinis.
---

[[index|Beranda]] $MidDot [[Untuk Sjawatdh (Landing)|Tentang Sjawatdh]]

---

``MEDICAL LEARNING PLATFORM``

# Belajar klinis, satu sesi lebih dekat.

Ruang belajar kedokteran terstruktur untuk memahami ilmu dasar, patologi, dan penerapannya dalam praktik klinis.

[[Endokrin Landing|Mulai Belajar $Arrow]] $MidDot [[Untuk Sjawatdh (Landing)|Filosofi & Manifesto]]

---

## Metode Pembelajaran

Setiap blok disusun menyerupai simposium akademik mandiri dengan urutan langkah yang jelas pada setiap sesi:

1. **01 Pretest** $EmDash Pemetaan awal untuk mengenali konsep yang belum dikuasai sebelum membaca referensi.
2. **02 Materi Inti** $EmDash Telaah terstruktur ilmu dasar (*Harrison's Principles of Internal Medicine*) dan patologi klinis.
3. **03 Posttest** $EmDash Evaluasi mandiri untuk mengukur pemahaman setelah menyelesaikan bacaan.

> [!tip] Pendamping Belajar $EmDash Broty
> *"Setiap sesi dapat dipelajari sesuai ritmemu sendiri. Tidak ada batas waktu atau penilaian yang menghakimi$EmDash gunakan hasil pretest dan posttest sebagai peta belajar."*

---

## Direktori Blok Sistem Organ

Tersedia **$($BlockItems.Count) blok sistem organ** dengan total **$totalSessions sesi pembelajaran** aktif.

| No | Blok Sistem | Fokus Pembelajaran | Cakupan | Akses |
| :---: | :--- | :--- | :---: | :---: |
$($catalogRows -join "`n")

---

## Tentang Sjawatdh

Sjawatdh disusun sebagai pendamping belajar mahasiswa kedokteran (*study companion*) yang dapat diakses secara terbuka dan gratis. Seluruh materi dirangkum untuk membantu penalaran klinis dan tidak dimaksudkan untuk menggantikan buku teks utama.

[[Untuk Sjawatdh (Landing)|Baca Selengkapnya tentang Sjawatdh $Arrow]]
"@
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
            $target = $m.Groups[1].Value.Trim().TrimEnd("\")
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
Write-Host "[OK] Homepage Webpage\index.md berhasil diperbarui" -ForegroundColor Green

$brokenLinks = @(Test-InternalLinks -WebpageRoot $webpageRoot)
if ($brokenLinks.Count -gt 0) {
    Write-Warning "Ditemukan $($brokenLinks.Count) tautan internal yang perlu diperiksa:"
    $brokenLinks | ForEach-Object { Write-Warning " - $_" }
} else {
    Write-Host "[OK] Validasi tautan selesai: 0 tautan rusak di seluruh Webpage/" -ForegroundColor Cyan
}

Write-Host "`n--- Status Git (siap direview sebelum commit) ---" -ForegroundColor Yellow
git status -sb