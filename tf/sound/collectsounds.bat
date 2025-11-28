@echo off
setlocal enabledelayedexpansion

REM Output file
set "OUTFILE=files.cfg"

REM Root folder (where this script is)
set "ROOT=%~dp0"

REM Clear previous cfg file
> "%OUTFILE%" echo.

REM Start LucySounds block
>> "%OUTFILE%" echo "LucySounds"
>> "%OUTFILE%" echo {

REM Recursively scan all files
for /r "%ROOT%" %%F in (*) do (
    set "FULL=%%F"
    set "REL=!FULL:%ROOT%=!"

    REM Remove _fem from folder names for source path
    set "SOURCE=!REL:_fem=!"
    
    REM Target path is the original relative path
    set "TARGET=!REL!"

    REM Output mapping line: SOURCE -> TARGET
    >> "%OUTFILE%" echo    "!SOURCE!"    "!TARGET!"
)

REM End block
>> "%OUTFILE%" echo }

echo Done! File mappings saved to "%OUTFILE%".
pause
