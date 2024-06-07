@echo off
setlocal enabledelayedexpansion

:: Prompt the user to select a folder
set "folder="
for /f "delims=" %%a in ('powershell -noprofile -command "Read-Host 'Select a folder:'"') do set "folder=%%a"

:: Check if the folder exists
if not exist "!folder!\" (
    echo Folder does not exist: "!folder!"
    pause
    exit /b
)

:: Retrieve the full path of the selected folder
for %%F in ("!folder!") do (
    set "input_directory=%%~dpF"
    set "folder_original_name=%%~nxF"
)

:: Execute the 7-Zip command
set "archive_name=!folder_original_name!.7z"
set "archive_full_path=!input_directory!!archive_name!"
7z a -v2000m -m0=Copy "!archive_full_path!" "!folder!\*"

echo Archive created: "!archive_full_path!"
pause
