@echo off
setlocal enabledelayedexpansion

REM 📍 Get the path to the folder containing this script (no trailing backslash)
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM 📁 Output folder inside the script directory
set "OUTPUT_DIR=%SCRIPT_DIR%\RepairedPDFs"

REM 🛠 Create output folder if it doesn't exist
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

echo 🛠 Repairing all PDFs in: %SCRIPT_DIR%
echo 💾 Repaired files will be saved to: %OUTPUT_DIR%
echo.

REM 🔁 Loop through each PDF in this folder
for %%F in ("%SCRIPT_DIR%\*.pdf") do (
    set "INFILE=%%~fF"
    set "FILENAME=%%~nF"
    echo ➤ Processing: !INFILE!
    gswin64c -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER ^
        -sOutputFile="%OUTPUT_DIR%\!FILENAME!_repaired.pdf" "!INFILE!"
)

echo.
echo ✅ All PDFs processed. Check: %OUTPUT_DIR%
pause
