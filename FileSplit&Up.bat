@echo off
title Execute Python Script

:: Run the Python script
python "D:\Tanmoy\Github\telegram-upload-upSplit\upSplit\FileSplit.py" %*

:: Check if the Python script completed successfully
if %errorlevel% equ 0 (
    echo Python script completed successfully.
    echo Now executing the .bat file...
    pause
    call "D:\Tanmoy\Github\telegram-upload-upSplit\upSplit\uploadALL.bat"
) else (
    echo Python script encountered an error.
    pause
)

:: Exit the batch script
exit /b
