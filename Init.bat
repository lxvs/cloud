@echo off
setlocal ENABLEDELAYEDEXPANSION
title=Linking Game Save Files...
cd /d %~dp0
set CloudFolder="C:\Program Files (x86)\Steam\userdata\324014709"
if not exist "C:\Users\%username%\Documents\My Games" md "C:\Users\%username%\Documents\My Games"
if not exist "C:\Users\%username%\Saved Games" md "C:\Users\%username%\Saved Games"
if not exist "C:\Users\%username%\Documents\Klei" (
    if exist "DoNotStarveTogether" md "C:\Users\%username%\Documents\Klei"
    if exist "OxygenNotIncluded" md "C:\Users\%username%\Documents\Klei"
)
echo.
call:fun "DoNotStarveTogether"          "C:\Users\%username%\Documents\Klei\DoNotStarveTogether"
call:fun "OxygenNotIncluded"            "C:\Users\%username%\Documents\Klei\OxygenNotIncluded"
call:fun "Planescape Torment"           "C:\Users\%username%\Documents\Planescape Torment - Enhanced Edition"
call:fun "Criterion Games"              "C:\Users\%username%\Documents\Criterion Games"
call:fun "GTA Vice City"                "C:\Users\%username%\Documents\GTA Vice City User Files"
call:fun "Euro Truck Simulator 2"       "C:\Users\%username%\Documents\Euro Truck Simulator 2"
call:fun "Streets of Rogue"             "C:\Users\%username%\Documents\Streets of Rogue"
call:fun "Fallout4"                     "C:\Users\%username%\Documents\My Games\Fallout4"
call:fun "Terraria"                     "C:\Users\%username%\Documents\My Games\Terraria"
call:fun "Torchlight 2"                 "C:\Users\%username%\Documents\My Games\runic games"
call:fun "Opus Magnum"                  "C:\Users\%username%\Documents\My Games\Opus Magnum"
call:fun "Diablo II"                    "C:\Users\%username%\Saved Games\Diablo II"
call:fun "The Long Dark"                "C:\Users\%username%\AppData\Local\Hinterland"
call:fun "World of Goo"                 "C:\Users\%username%\AppData\Local\2DBoy"
call:fun "UNDERTALE"                    "C:\Users\%username%\AppData\Local\UNDERTALE"
call:fun "Geometry Dash"                "C:\Users\%username%\AppData\Local\GeometryDash"
call:fun "Bejeweled3"                   "C:\Users\%username%\AppData\Local\Steam\Bejeweled3"
call:fun "Nuclear Throne"               "C:\Users\%username%\AppData\Local\nuclearthrone"
call:fun "Car Mechanic Simulator 2015"  "C:\Users\%username%\AppData\LocalLow\Red Dot Games" 
call:fun "Thief Simulator"              "C:\Users\%username%\AppData\LocalLow\Noble Muffins"
call:fun "Slime Rancher"                "C:\Users\%username%\AppData\LocalLow\Monomi Park"
call:fun "Enter the Gungeon"            "C:\Users\%username%\AppData\LocalLow\Dodge Roll"
call:fun "Hollow Knight"                "C:\Users\%username%\AppData\LocalLow\Team Cherry"
call:fun "the Forest"                   "C:\Users\%username%\AppData\LocalLow\SKS"
call:fun "Human Resource Machine"       "C:\Users\%username%\AppData\Roaming\Human Resource Machine"
call:fun "Little Inferno"               "C:\Users\%username%\AppData\Roaming\Little Inferno" 
call:fun "DarkSoulsIII"                 "C:\Users\%username%\AppData\Roaming\DarkSoulsIII"
call:fun "sekiro"                       "C:\Users\%username%\AppData\Roaming\sekiro"
call:fun "StardewValley"                "C:\Users\%username%\AppData\Roaming\StardewValley"
call:fun "Death Road to Canada"         "C:\Users\%username%\AppData\Roaming\.madgarden"
call:fun "FEZ"                          "C:\Users\%username%\AppData\Roaming\FEZ"
call:fun "Celeste"                      "C:\Program Files (x86)\Steam\steamapps\common\Celeste\Saves"
call:fun "Rabi-Ribi"                    "C:\Program Files (x86)\Steam\steamapps\common\Rabi-Ribi\Save"
call:fun "CSCZ"                         "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\czero\Save"
call:fun "Slay the Spire"               "C:\Program Files (x86)\Steam\steamapps\common\SlayTheSpire\preferences"

call:funC "Unepic"                          233980
call:funC "The End Is Nigh"                 583470
call:funC "Terraria SteamCloud"             105600
call:funC "Planescape Torment SteamCloud"   466300
call:funC "Dead Cells"                      588650

title Finished!
echo.
echo. ^> All finished!
pause > nul
exit

:fun
if exist %1 (
    echo. ^# %~1
    if not exist %2 (
        mklink /d %2 "%cd%\%~1" > nul && (echo. ^> Finished.) || goto Failed
        ) else (
        set /p pp=">> There have been save files of %~1, input Y to replace them: "
        if "!pp!"=="y" set pp=Y
        if "!pp!"=="Y" (
            rd /s /q %2
            mklink /d %2 "%cd%\%~1" > nul && (echo. ^> Finished.) || goto Failed
            set pp=
        ))
    echo.
    )
goto:eof

:funC
if exist %1 (
    echo. ^# %~1
    if not exist %CloudFolder% md %CloudFolder%
    if not exist "%CloudFolder:~1,-1%\%2" (
        mklink /d "%CloudFolder:~1,-1%\%2" "%cd%\%~1" > nul && (echo. ^> Finished.) || call:Failed
        ) else (
        set /p pp=">> There have been save files of %~1, input Y to replace them: "
        if "!pp!"=="y" set pp=Y
        if "!pp!"=="Y" (
            rd /s /q "%CloudFolder:~1,-1%\%2"
            mklink /d "%CloudFolder:~1,-1%\%2" "%cd%\%~1" > nul && (echo. ^> Finished.) || call:Failed
            set pp=
        ))
    echo.
    )
goto:eof

:Failed
title FATAL ERROR: Please run this as administrator!
cls
echo.
echo. ^* FATAL ERROR: Please run this as administrator!
echo.
pause > nul
exit

