[CmdletBinding()]
param([switch]$System)

$ErrorActionPreference = 'Stop'
$refresh = $null

if (Get-Command tlmgr -ErrorAction SilentlyContinue) {
    $scope = if ($System) { 'TEXMFLOCAL' } else { 'TEXMFHOME' }
    $texmf = @(kpsewhich "-var-value=$scope")
    if ($LASTEXITCODE -ne 0) { throw "Could not locate $scope." }
    if ($System) {
        Get-Command mktexlsr | Out-Null
        $refresh = { mktexlsr $texmf }
    }
} elseif (Get-Command miktex -ErrorAction SilentlyContinue) {
    $root = if ($System) { 'CommonInstall' } else { 'UserInstall' }
    $report = @(initexmf --report)
    if ($LASTEXITCODE -ne 0) { throw 'Could not read MiKTeX settings.' }
    $texmf = @($report -match "^${root}: " -replace "^${root}: ", '')
    $refresh = if ($System) { { miktex --admin fndb refresh } } else { { miktex fndb refresh } }
} else {
    throw 'TeX Live or MiKTeX is required.'
}

if ($texmf.Count -ne 1 -or $texmf[0] -match '[;{}]' -or $texmf[0] -notmatch '^(?:[A-Za-z]:[\\/]|[\\/]{2}[^\\/])') {
    throw 'Expected one absolute TeX installation directory.'
}
$texmf = $texmf[0]

$workdir = Join-Path ([IO.Path]::GetTempPath()) ('enlp-beamer-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $workdir | Out-Null
try {
    $releases = 'https://github.com/EhimeNLP/enlp-slide-template/releases'
    $headers = Join-Path $workdir 'latest.headers'
    $latestUrl = curl.exe -fsSIL -o $headers -w '%{url_effective}' "$releases/latest"
    if ($LASTEXITCODE -ne 0) { throw 'Could not resolve the latest release.' }
    $tagPattern = '\A' + [regex]::Escape("$releases/tag/") + '(v[A-Za-z0-9._-]+)\z'
    if ($latestUrl -cnotmatch $tagPattern) { throw "Unexpected release URL: $latestUrl" }
    $tag = $Matches[1]

    $archive = Join-Path $workdir 'enlp-slide-template.zip'
    curl.exe -fsSL "$releases/download/$tag/enlp-slide-template-$tag.zip" -o $archive
    if ($LASTEXITCODE -ne 0) { throw "Could not download release $tag." }
    Expand-Archive -LiteralPath $archive -DestinationPath $workdir

    $src = Join-Path $workdir 'enlp-slide-template'
    $latexFiles = @(
        'beamerthemeenlp.sty', 'beamercolorthemeenlp.sty', 'beamerfontthemeenlp.sty',
        'beamerinnerthemeenlp.sty', 'beamerouterthemeenlp.sty', 'enlplogo.sty',
        'enlpbeamer.bbx', 'enlpbeamer.cbx'
    )
    $bstFile = 'enlpbeamer.bst'
    foreach ($file in ($latexFiles + $bstFile)) {
        if (-not (Test-Path -LiteralPath (Join-Path $src $file) -PathType Leaf)) {
            throw "Release $tag is missing $file."
        }
    }

    $texDir = Join-Path $texmf 'tex/latex/enlp-beamer'
    $bstDir = Join-Path $texmf 'bibtex/bst/enlp-beamer'
    New-Item -ItemType Directory -Force -Path $texDir, $bstDir | Out-Null
    $latexPaths = $latexFiles | ForEach-Object { Join-Path $src $_ }
    Copy-Item -LiteralPath $latexPaths -Destination $texDir -Force
    Copy-Item -LiteralPath (Join-Path $src $bstFile) -Destination $bstDir -Force

    if ($refresh) {
        & $refresh
        if ($LASTEXITCODE -ne 0) { throw 'Could not refresh the TeX file database.' }
    }
    Write-Output "Installed enlp-beamer $tag in $texmf"
} finally {
    Remove-Item -LiteralPath $workdir -Recurse -Force
}
