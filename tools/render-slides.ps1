param([string]$Source = 'aulas/agentes-ia-pesquisa.qmd')

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path $PSScriptRoot -Parent
Push-Location $repoRoot
try {
    if (-not (Test-Path -LiteralPath $Source)) { throw "Fonte inexistente: $Source" }
    $sourcePath = (Resolve-Path -LiteralPath $Source).Path
    $relativeSource = [IO.Path]::GetRelativePath($repoRoot, $sourcePath)
    if ($relativeSource.StartsWith('..') -or [IO.Path]::IsPathRooted($relativeSource)) {
        throw 'A fonte deve estar dentro do repositório.'
    }
    & quarto render $relativeSource --to madrid-web-beamer
    if ($LASTEXITCODE -ne 0) { throw 'Falha na renderização: madrid-web-beamer' }
    $outputRelative = Join-Path ([IO.Path]::GetDirectoryName($relativeSource)) ([IO.Path]::GetFileNameWithoutExtension($relativeSource))
    $built = Join-Path $repoRoot (Join-Path '_site' "$outputRelative.pdf")
    $target = Join-Path $repoRoot 'assets/agentes-ia-pesquisa.pdf'
    Copy-Item -LiteralPath $built -Destination $target -Force
    Write-Output "PDF (Beamer Madrid): assets/agentes-ia-pesquisa.pdf (versionar apos conferir)"
} finally {
    Pop-Location
}
