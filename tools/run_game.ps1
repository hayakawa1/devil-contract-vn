param(
  [int]$Port = 8000
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$gameDir = Join-Path $repoRoot "game"

if (-not (Test-Path $gameDir)) {
  throw "game directory not found: $gameDir"
}

Set-Location $gameDir

Write-Host "Serving: $gameDir"
Write-Host "URL: http://localhost:$Port/"
Write-Host "Stop: Ctrl+C"

Start-Process "http://localhost:$Port/" | Out-Null
python -m http.server $Port

