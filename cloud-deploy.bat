@echo off
setlocal
pushd %~dp0
set "steamFolder=%programfiles(x86)%\Steam"
set "cloudFolder=%steamFolder%\userdata\324014709"
if not exist "%userprofile%\Documents\My Games" md "%userprofile%\Documents\My Games"
if not exist "%userprofile%\Saved Games" md "%userprofile%\Saved Games"
if not exist "%userprofile%\Documents\Klei" (
    if exist "DoNotStarveTogether" md "%userprofile%\Documents\Klei"
    if exist "OxygenNotIncluded" md "%userprofile%\Documents\Klei" 2>nul
)
call:Link "DoNotStarveTogether" ^
    "%userprofile%\Documents\Klei\DoNotStarveTogether"
call:Link "OxygenNotIncluded" ^
    "%userprofile%\Documents\Klei\OxygenNotIncluded"
call:Link "Planescape Torment" ^
    "%userprofile%\Documents\Planescape Torment - Enhanced Edition"
call:Link "Criterion Games" ^
    "%userprofile%\Documents\Criterion Games"
call:Link "GTA Vice City" ^
    "%userprofile%\Documents\GTA Vice City User Files"
call:Link "Euro Truck Simulator 2" ^
    "%userprofile%\Documents\Euro Truck Simulator 2"
call:Link "Streets of Rogue" ^
    "%userprofile%\Documents\Streets of Rogue"
call:Link "Fallout4" ^
    "%userprofile%\Documents\My Games\Fallout4"
call:Link "Terraria" ^
    "%userprofile%\Documents\My Games\Terraria"
call:Link "Torchlight 2" ^
    "%userprofile%\Documents\My Games\runic games"
call:Link "Opus Magnum" ^
    "%userprofile%\Documents\My Games\Opus Magnum"
call:Link "Diablo II" ^
    "%userprofile%\Saved Games\Diablo II"
call:Link "The Long Dark" ^
    "%userprofile%\AppData\Local\Hinterland"
call:Link "World of Goo" ^
    "%userprofile%\AppData\Local\2DBoy"
call:Link "UNDERTALE" ^
    "%userprofile%\AppData\Local\UNDERTALE"
call:Link "Geometry Dash" ^
    "%userprofile%\AppData\Local\GeometryDash"
call:Link "Bejeweled3" ^
    "%userprofile%\AppData\Local\Steam\Bejeweled3"
call:Link "Nuclear Throne" ^
    "%userprofile%\AppData\Local\nuclearthrone"
call:Link "Car Mechanic Simulator 2015" ^
    "%userprofile%\AppData\LocalLow\Red Dot Games"
call:Link "Thief Simulator" ^
    "%userprofile%\AppData\LocalLow\Noble Muffins"
call:Link "Slime Rancher" ^
    "%userprofile%\AppData\LocalLow\Monomi Park"
call:Link "Enter the Gungeon" ^
    "%userprofile%\AppData\LocalLow\Dodge Roll"
call:Link "Hollow Knight" ^
    "%userprofile%\AppData\LocalLow\Team Cherry"
call:Link "the Forest" ^
    "%userprofile%\AppData\LocalLow\SKS"
call:Link "Human Resource Machine" ^
    "%userprofile%\AppData\Roaming\Human Resource Machine"
call:Link "Little Inferno" ^
    "%userprofile%\AppData\Roaming\Little Inferno"
call:Link "DarkSoulsIII" ^
    "%userprofile%\AppData\Roaming\DarkSoulsIII"
call:Link "sekiro" ^
    "%userprofile%\AppData\Roaming\sekiro"
call:Link "StardewValley" ^
    "%userprofile%\AppData\Roaming\StardewValley"
call:Link "Death Road to Canada" ^
    "%userprofile%\AppData\Roaming\.madgarden"
call:Link "FEZ" ^
    "%userprofile%\AppData\Roaming\FEZ"
call:Link "Celeste" ^
    "%steamFolder%\steamapps\common\Celeste\Saves"
call:Link "Rabi-Ribi" ^
    "%steamFolder%\steamapps\common\Rabi-Ribi\Save"
call:Link "CSCZ" ^
    "%steamFolder%\steamapps\common\Half-Life\czero\Save"
call:Link "Slay the Spire" ^
    "%steamFolder%\steamapps\common\SlayTheSpire\preferences"

call:LinkC 233980 "Unepic"
call:LinkC 583470 "The End Is Nigh"
call:LinkC 105600 "Terraria SteamCloud"
call:LinkC 466300 "Planescape Torment SteamCloud"
call:LinkC 588650 "Dead Cells"

echo ^> All finished.
pause
exit /b 0

:Link
if exist %1 (
    echo %~1
    if not exist "%~dp2" (
        echo ^> Game is not installed.
        echo;
        goto:eof
    )
    if not exist "%~2" (
        mklink /d "%~2" "%cd%\%~1" >nul 2>&1 || goto failed
        echo ^> Finished.
    ) else call:LinkOW %1 %2
    echo;
)
goto:eof

:LinkOW
set owcfm=
set /p owcfm="> There have been save files of %~1, input Y to overwrite: "
if /i "%owcfm%"=="Y" (
    rd /s /q "%~2"
    mklink /d "%~2" "%cd%\%~1" >nul 2>&1 || goto failed
    echo ^> Finished.
) else echo ^> Ignored.
goto:eof

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
goto:eof

:LinkCOW
set owcfm=
set /p owcfm="> There have been save files of %~2, input Y to overwrite: "
if /i "%owcfm%"=="Y" (
    rd /s /q "%cloudFolder%\%~1"
    mklink /d "%cloudFolder%\%~1" "%cd%\%~2" >nul 2>&1 || goto failed
    echo ^> Finished.
) else echo ^> Ignored.
goto:eof

:failed
echo ^> ERROR: Please run this as administrator.
pause
exit 1
