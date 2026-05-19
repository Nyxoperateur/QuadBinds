# Télécharge et installe le driver Interception depuis GitHub (admin requis).
param(
    [string]$InstallDir = "$env:LOCALAPPDATA\QuadBinds\Interception"
)

$ErrorActionPreference = "Stop"
$release = "https://api.github.com/repos/oblitum/Interception/releases/latest"

Write-Host ""
Write-Host "=== QuadBinds - Installation Interception ===" -ForegroundColor Cyan
Write-Host ""

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)
if (-not $isAdmin) {
    Write-Host "Relance ce script en administrateur." -ForegroundColor Red
    exit 1
}

Write-Host "[1/4] Recherche de la derniere version sur GitHub..."
$rel = Invoke-RestMethod -Uri $release -Headers @{ "User-Agent" = "QuadBinds" }
$asset = $rel.assets | Where-Object { $_.name -match '\.zip$' } | Select-Object -First 1
if (-not $asset) {
    Write-Host "Aucun fichier .zip trouve sur la release." -ForegroundColor Red
    exit 1
}
Write-Host "      Version: $($rel.tag_name) - $($asset.name)"

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
$zipPath = Join-Path $InstallDir $asset.name

Write-Host "[2/4] Telechargement..."
Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath -UseBasicParsing

Write-Host "[3/4] Extraction..."
Expand-Archive -Path $zipPath -DestinationPath $InstallDir -Force

$installer = Get-ChildItem -Path $InstallDir -Recurse -Filter "install-interception.exe" | Select-Object -First 1
if (-not $installer) {
    $installer = Get-ChildItem -Path $InstallDir -Recurse -Filter "install.exe" | Select-Object -First 1
}
if (-not $installer) {
    Write-Host "Installateur introuvable dans l'archive." -ForegroundColor Red
    exit 1
}

Write-Host "[4/4] Lancement de l'installateur driver..."
Write-Host "      $($installer.FullName) /install"
Start-Process -FilePath $installer.FullName -ArgumentList "/install" -Wait

Write-Host ""
Write-Host "Interception installe. REDEMARRE ton PC avant d'utiliser QuadBinds." -ForegroundColor Green
Write-Host ""
