@echo off
setlocal enabledelayedexpansion

:: Configuration (%~dp0 to make it run relative to the script itself)
set ASAR="%~dp0/asar/asar.exe"
set ASSEMBLE="%~dp0/disassembly/assemble.asm"
set ROM_NAME_BASE=yi
set ROM_NAME=%ROM_NAME_BASE%.sfc
set HASH_MD5="%~dp0/yi.md5sum"
set HASH_SHA1="%~dp0/yi.sha1sum"
set HASH_SHA256="%~dp0/yi.sha256sum"

:: Build
echo Building ^"%ROM_NAME%^"...
echo.
%ASAR% %ASSEMBLE% %ROM_NAME%
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Build FAILED^^!
    goto :pause
)
echo Build succeeded^^!

:: Check build
echo.
echo Checking build...
echo.
set match=true
:: - Check MD5
for /f "delims=" %%a in ('certutil -hashfile %ROM_NAME% MD5 ^| findstr /v "hash"') do set "current_md5=%%a"
set "current_md5=%current_md5: =%"
findstr /i "%current_md5%" %HASH_MD5% >nul
if %errorlevel% equ 0 (echo MD5 match succeeded^^!) else (echo MD5 match FAILED^^! && set match=false)
:: - Check SHA1
for /f "delims=" %%a in ('certutil -hashfile %ROM_NAME% SHA1 ^| findstr /v "hash"') do set "current_sha1=%%a"
set "current_sha1=%current_sha1: =%"
findstr /i "%current_sha1%" %HASH_SHA1% >nul
if %errorlevel% equ 0 (echo SHA1 match succeeded^^!) else (echo SHA1 match FAILED^^! && set match=false)
:: - Check SHA256
for /f "delims=" %%a in ('certutil -hashfile %ROM_NAME% SHA256 ^| findstr /v "hash"') do set "current_sha256=%%a"
set "current_sha256=%current_sha256: =%"
findstr /i "%current_sha256%" %HASH_SHA256% >nul
if %errorlevel% equ 0 (echo SHA256 match succeeded^^!) else (echo SHA256 match FAILED^^! && set match=false)

:: Compare build with user-provided rom if match failed
if %match% == false (
    echo.
    set /p rom_path= "Enter path to your Yoshi's Island rom to check where build differs (leave blank to skip): "
    if not "!rom_path!"=="" (
        echo.
        fc /b %ROM_NAME% !rom_path!
    )
)

:pause
echo.
pause