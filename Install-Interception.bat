@echo off
setlocal EnableExtensions
cd /d "%~dp0"

echo.
echo  ========================================
echo   QuadBinds - Installation Interception
echo  ========================================
echo.

net session >nul 2>&1
if not %ERRORLEVEL%==0 (
    echo Demande des droits administrateur...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "PS1=%~dp0Install-Interception.ps1"
if not exist "%PS1%" (
    echo ERREUR: fichier manquant: Install-Interception.ps1
    echo Relance build.bat depuis les sources ou copie le script depuis scripts\
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
set "ERR=%ERRORLEVEL%"
echo.
if %ERR%==0 (
    echo Termine. Redemarre ton PC avant d'utiliser QuadBinds.
) else (
    echo Echec ^(code %ERR%^). Verifie ta connexion internet et reessaie.
)
echo.
pause
exit /b %ERR%
