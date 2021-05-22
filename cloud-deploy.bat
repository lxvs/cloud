@echo off
setlocal

@set "version=v1.0.1"
@set "lupdate=2021-05-22"
@title Cloud Save Linker %version%
@echo;
@echo     Cloud Save Linker %version%
@echo     https://github.com/lxvs/cloud
@echo     Last update: %lupdate%
@echo;

pushd %~dp0

@set "steamFolder=%programfiles(x86)%\Steam"
@set "steamCommon=%steamFolder%\steamapps\common"
@set "cloudFolder=%steamFolder%\userdata\324014709"
@set "documents=%USERPROFILE%\Documents"
@set "mygames=%documents%\My Games"
@set "savedgames=%USERPROFILE%\Saved Games"
@set "localLowAppData=%USERPROFILE%\AppdData\LocalLow"

if not exist "%mygames%" md "%mygames%"
if not exist "%savedgames%" md "%savedgames%"
if not exist "%documents%\Klei" (
    if exist "DoNotStarveTogether" md "%documents%\Klei"
    if exist "OxygenNotIncluded" md "%documents%\Klei" 2>nul
)
call:Link "DoNotStarveTogether" ^
    "%documents%\Klei\DoNotStarveTogether"
call:Link "OxygenNotIncluded" ^
    "%documents%\Klei\OxygenNotIncluded"
call:Link "Planescape Torment" ^
    "%documents%\Planescape Torment - Enhanced Edition"
call:Link "Criterion Games" ^
    "%documents%\Criterion Games"
call:Link "GTA Vice City" ^
    "%documents%\GTA Vice City User Files"
call:Link "Euro Truck Simulator 2" ^
    "%documents%\Euro Truck Simulator 2"
call:Link "Streets of Rogue" ^
    "%documents%\Streets of Rogue"
call:Link "Fallout4" ^
    "%mygames%\Fallout4"
call:Link "Terraria" ^
    "%mygames%\Terraria"
call:Link "Torchlight 2" ^
    "%mygames%\runic games"
call:Link "Opus Magnum" ^
    "%mygames%\Opus Magnum"
call:Link "Diablo II" ^
    "%savedgames%\Diablo II"
call:Link "The Long Dark" ^
    "%LOCALAPPDATA%\Hinterland"
call:Link "World of Goo" ^
    "%LOCALAPPDATA%\2DBoy"
call:Link "UNDERTALE" ^
    "%LOCALAPPDATA%\UNDERTALE"
call:Link "Geometry Dash" ^
    "%LOCALAPPDATA%\GeometryDash"
call:Link "Bejeweled3" ^
    "%LOCALAPPDATA%\Steam\Bejeweled3"
call:Link "Nuclear Throne" ^
    "%LOCALAPPDATA%\nuclearthrone"
call:Link "Car Mechanic Simulator 2015" ^
    "%localLowAppData%\Red Dot Games"
call:Link "Thief Simulator" ^
    "%localLowAppData%\Noble Muffins"
call:Link "Slime Rancher" ^
    "%locallowappdata%\Monomi Park"
call:Link "Enter the Gungeon" ^
    "%localLowAppData%\Dodge Roll"
call:Link "Hollow Knight" ^
    "%localLowAppData%\Team Cherry"
call:Link "the Forest" ^
    "%localLowAppData%\SKS"
call:Link "Human Resource Machine" ^
    "%APPDATA%\Human Resource Machine"
call:Link "Little Inferno" ^
    "%APPDATA%\Little Inferno"
call:Link "DarkSoulsIII" ^
    "%APPDATA%\DarkSoulsIII"
call:Link "sekiro" ^
    "%APPDATA%\sekiro"
call:Link "StardewValley" ^
    "%APPDATA%\StardewValley"
call:Link "Death Road to Canada" ^
    "%APPDATA%\.madgarden"
call:Link "FEZ" ^
    "%APPDATA%\FEZ"
call:Link "Celeste" ^
    "%steamCommon%\Celeste\Saves"
call:Link "Rabi-Ribi" ^
    "%steamCommon%\Rabi-Ribi\Save"
call:Link "CSCZ" ^
    "%steamCommon%\Half-Life\czero\Save"
call:Link "Slay the Spire" ^
    "%steamCommon%\SlayTheSpire\preferences"

call:LinkC 233980 "Unepic"
call:LinkC 583470 "The End Is Nigh"
call:LinkC 105600 "Terraria SteamCloud"
call:LinkC 466300 "Planescape Torment SteamCloud"
call:LinkC 588650 "Dead Cells"

@popd
echo ^> All finished.
pause
exit /b 0

:Link
if exist %1 (
    echo %~1
    if not exist "%~dp2" (
        echo ^> Game is not installed.
        echo;
        exit /b
    )
    if not exist "%~2" (
        mklink /d "%~2" "%cd%\%~1" >nul 2>&1 || goto failed
        echo ^> Finished.
    ) else call:LinkOW %1 %2
    echo;
)
exit /b

:LinkOW
set owcfm=
set /p owcfm="> There have been save files of %~1, input Y to overwrite: "
if /i "%owcfm%"=="Y" (
    rd /s /q "%~2"
    mklink /d "%~2" "%cd%\%~1" >nul 2>&1 || goto failed
    echo ^> Finished.
) else echo ^> Ignored.
exit /b

:LinkC
if exist "%~2" (
    echo %~2
    if not exist "%cloudFolder%" md "%cloudFolder%"
    if not exist "%cloudFolder%\%~1" (
        mklink /d "%cloudFolder%\%~1" "%cd%\%~2" >nul 2>&1 || goto failed
        echo ^> Finished.
    ) else call:LinkCOW %1 %2
    echo;
)
exit /b

:LinkCOW
set owcfm=
set /p owcfm="> There have been save files of %~2, input Y to overwrite: "
if /i "%owcfm%"=="Y" (
    rd /s /q "%cloudFolder%\%~1"
    mklink /d "%cloudFolder%\%~1" "%cd%\%~2" >nul 2>&1 || goto failed
    echo ^> Finished.
) else echo ^> Ignored.
exit /b

:failed
@popd
echo ^> ERROR: Please run this as administrator.
pause
exit 1
