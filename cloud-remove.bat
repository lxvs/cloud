@echo off
setlocal

@REM =======================================================================
@set "steamFolder=%programfiles(x86)%\Steam"
@set "steamUserId=324014709"
@set "steamCommon=%steamFolder%\steamapps\common"
@set "cloudFolder=%steamFolder%\userdata\%steamUserId%"
@set "documents=%USERPROFILE%\Documents"
@set "my_games=%documents%\My Games"
@set "savedgames=%USERPROFILE%\SavedGames"
@set "saved_games=%USERPROFILE%\Saved Games"
@set "localLowAppData=%USERPROFILE%\AppData\LocalLow"
@REM =======================================================================

@pushd %~dp0

@if not exist gamelist if not exist gamelist-steamcloud (
    @>&2 echo ERROR: could not find file 'gamelist' or 'gamelist-steamcloud'!
    @pause
    @popd
    exit /b 1
)

@if exist gamelist for /f "eol=$ tokens=1,2 delims=|" %%a in (gamelist) do @call:Unlink "%%a" "%%b"
@echo;

@rd "%my_games%" 2>nul && @echo removed empty folder %my_games%
@rd "%savedgames%" 2>nul && @echo removed empty folder %savedgames%
@rd "%saved_games%" 2>nul && @echo removed empty folder %saved_games%
@rd "%documents%\Klei" 2>nul && @echo removed empty folder %documents%\Klei
@echo;

@if exist gamelist-steamcloud for /f "eol=$ tokens=1,2 delims=|" %%a in (gamelist-steamcloud) do @call:UnlinkC "%%a" "%%b"
@echo;

pause
@popd
exit /b 0

:Unlink
if exist "%~2" rd "%~2" 2>nul && (echo ^> %~1 was removed.) || echo ** %~1 was not removed.
exit /b

:UnlinkC
if exist "%cloudFolder%\%~1" rd "%cloudFolder%\%~1" 2>nul && (echo ^> %~2 was removed.) || echo ** %~2 was not removed.
exit /b
