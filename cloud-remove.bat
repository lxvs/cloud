@echo off
setlocal
set "steamFolder=%programfiles(x86)%\Steam"
set "cloudFolder=%steamFolder%\userdata\324014709"

call:Unink "DoNotStarveTogether" ^
    "%userprofile%\Documents\Klei\DoNotStarveTogether"
call:Unink "OxygenNotIncluded" ^
    "%userprofile%\Documents\Klei\OxygenNotIncluded"
call:Unink "Planescape Torment" ^
    "%userprofile%\Documents\Planescape Torment - Enhanced Edition"
call:Unink "Criterion Games" ^
    "%userprofile%\Documents\Criterion Games"
call:Unink "GTA Vice City" ^
    "%userprofile%\Documents\GTA Vice City User Files"
call:Unink "Euro Truck Simulator 2" ^
    "%userprofile%\Documents\Euro Truck Simulator 2"
call:Unink "Streets of Rogue" ^
    "%userprofile%\Documents\Streets of Rogue"
call:Unink "Fallout4" ^
    "%userprofile%\Documents\My Games\Fallout4"
call:Unink "Terraria" ^
    "%userprofile%\Documents\My Games\Terraria"
call:Unink "Torchlight 2" ^
    "%userprofile%\Documents\My Games\runic games"
call:Unink "Opus Magnum" ^
    "%userprofile%\Documents\My Games\Opus Magnum"
call:Unink "Diablo II" ^
    "%userprofile%\Saved Games\Diablo II"
call:Unink "The Long Dark" ^
    "%userprofile%\AppData\Local\Hinterland"
call:Unink "World of Goo" ^
    "%userprofile%\AppData\Local\2DBoy"
call:Unink "UNDERTALE" ^
    "%userprofile%\AppData\Local\UNDERTALE"
call:Unink "Geometry Dash" ^
    "%userprofile%\AppData\Local\GeometryDash"
call:Unink "Bejeweled3" ^
    "%userprofile%\AppData\Local\Steam\Bejeweled3"
call:Unink "Nuclear Throne" ^
    "%userprofile%\AppData\Local\nuclearthrone"
call:Unink "Car Mechanic Simulator 2015" ^
    "%userprofile%\AppData\LocalLow\Red Dot Games"
call:Unink "Thief Simulator" ^
    "%userprofile%\AppData\LocalLow\Noble Muffins"
call:Unink "Slime Rancher" ^
    "%userprofile%\AppData\LocalLow\Monomi Park"
call:Unink "Enter the Gungeon" ^
    "%userprofile%\AppData\LocalLow\Dodge Roll"
call:Unink "Hollow Knight" ^
    "%userprofile%\AppData\LocalLow\Team Cherry"
call:Unink "the Forest" ^
    "%userprofile%\AppData\LocalLow\SKS"
call:Unink "Human Resource Machine" ^
    "%userprofile%\AppData\Roaming\Human Resource Machine"
call:Unink "Little Inferno" ^
    "%userprofile%\AppData\Roaming\Little Inferno"
call:Unink "DarkSoulsIII" ^
    "%userprofile%\AppData\Roaming\DarkSoulsIII"
call:Unink "sekiro" ^
    "%userprofile%\AppData\Roaming\sekiro"
call:Unink "StardewValley" ^
    "%userprofile%\AppData\Roaming\StardewValley"
call:Unink "Death Road to Canada" ^
    "%userprofile%\AppData\Roaming\.madgarden"
call:Unink "FEZ" ^
    "%userprofile%\AppData\Roaming\FEZ"
call:Unink "Celeste" ^
    "%steamFolder%\steamapps\common\Celeste\Saves"
call:Unink "Rabi-Ribi" ^
    "%steamFolder%\steamapps\common\Rabi-Ribi\Save"
call:Unink "CSCZ" ^
    "%steamFolder%\steamapps\common\Half-Life\czero\Save"
call:Unink "Slay the Spire" ^
    "%steamFolder%\steamapps\common\SlayTheSpire\preferences"

call:UninkC 233980 "Unepic"
call:UninkC 583470 "The End Is Nigh"
call:UninkC 105600 "Terraria SteamCloud"
call:UninkC 466300 "Planescape Torment SteamCloud"
call:UninkC 588650 "Dead Cells"

pause
exit /b 0

:Unink
if exist "%~2" rd "%~2" 2>nul && (echo ^> %~1 was removed.) || echo ** %~1 was not removed.
goto:eof

:UninkC
if exist "%cloudFolder%\%~1" rd "%cloudFolder%\%~1" 2>nul && (echo ^> %~2 was removed.) || echo ** %~2 was not removed.
goto:eof
