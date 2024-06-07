@echo off
setlocal

:: Prompt the user to select a file using the file manager
set "fileFilter=All Files (*.*)|*.*"
for /f "delims=" %%I in ('powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $dlg = New-Object Windows.Forms.OpenFileDialog; $dlg.Filter = '%fileFilter%'; $dlg.ShowDialog() | Out-Null; $dlg.FileName"') do set "selectedFile=%%I"

:: Check if a file was selected
if "%selectedFile%"=="" (
    echo No file selected. Exiting.
    exit /b
)

:: Execute the Telegram upload command with the full path
set "telegramCommand=telegram-upload --to TheBoTCollecTive "%selectedFile%""
echo Executing: %telegramCommand%
%telegramCommand%

:: Clean up and exit
endlocal
