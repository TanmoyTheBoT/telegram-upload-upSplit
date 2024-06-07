@echo off
setlocal

REM Specify the paths to your batch files
set "first_batch_file=c:\fullpath\upSplit\upSplit\FolderSplit.bat"
set "second_batch_file=c:\fullpath\upSplit\upSplit\uploadALL.bat"

REM Execute the first batch file
call "%first_batch_file%"

REM Check if the first batch file completed successfully
if %errorlevel% equ 0 (
    echo First batch file completed successfully.
    pause

    REM Execute the second batch file
    call "%second_batch_file%"
) else (
    echo First batch file was canceled.
    choice /M "Do you want to continue with the second batch file? (Y/N)"
    if errorlevel 2 (
        echo Stopping the full batch script.
        pause
        exit /b 1
    ) else (
        echo Continuing with the second batch file.
        call "%second_batch_file%"
    )
)

endlocal
