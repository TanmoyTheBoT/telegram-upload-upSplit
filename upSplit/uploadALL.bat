@echo off
setlocal enabledelayedexpansion

:: Prompt the user to select multiple files using the file manager
set "fileFilter=All Files (*.*)|*.*"
set "fileCount=0"
for /f "delims=" %%I in ('powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $dlg = New-Object Windows.Forms.OpenFileDialog; $dlg.Filter = '%fileFilter%'; $dlg.Multiselect = $true; $dlg.ShowDialog() | Out-Null; foreach ($file in $dlg.FileNames) { Write-Output $file }"') do (
    set /a "fileCount+=1"
    set "selectedFile[!fileCount!]=%%I"
)

:: Check if any files were selected
if %fileCount%==0 (
    echo No files selected. Exiting.
    exit /b
)

:: Execute the Telegram upload command for each selected file
for /l %%N in (1,1,%fileCount%) do (
    set "currentFile=!selectedFile[%%N]!"
    set "telegramCommand=telegram-upload --to telegramchannelusername "!currentFile!""
    echo Executing: !telegramCommand!
    !telegramCommand!
)

:: Clean up and exit
endlocal
