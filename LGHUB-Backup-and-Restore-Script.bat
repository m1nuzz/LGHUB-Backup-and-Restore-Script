@echo off
setlocal enabledelayedexpansion

:: Specify paths for backup
set backup_dir=%~dp0backup
set folders_to_backup="C:\Program Files\LGHUB" "C:\ProgramData\LGHUB" "%LOCALAPPDATA%\LGHUB" "%APPDATA%\LGHUB"

:: Menu selection
:menu
echo Select an action:
echo 1. Create a backup
echo 2. Restore from backup
set /p choice=Enter 1 or 2: 
if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore
echo Invalid input. Please try again.
goto menu

:backup
echo Creating backup...
if not exist "%backup_dir%" mkdir "%backup_dir%"
for %%f in (%folders_to_backup%) do (
    if exist %%f (
        set relative_path=%%~dpnxpf
        set relative_path=!relative_path:C:=C!
        set relative_path=!relative_path:\=_!
        echo Backing up %%f to %backup_dir%\!relative_path!... 
        robocopy "%%f" "%backup_dir%\!relative_path!" /E /COPYALL /R:3 /W:5 >nul
    ) else (
        echo Folder %%f not found, skipping.
    )
)
echo Backup completed.
goto end

:restore
echo Restoring from backup...
for %%f in (%folders_to_backup%) do (
    set relative_path=%%~dpnxpf
    set relative_path=!relative_path:C:=C!
    set relative_path=!relative_path:\=_!
    if exist "%backup_dir%\!relative_path!" (
        echo Restoring %%f from %backup_dir%\!relative_path!... 
        robocopy "%backup_dir%\!relative_path!" "%%f" /E /COPYALL /R:3 /W:5 >nul
    ) else (
        echo Backup for %%f not found, skipping.
    )
)
echo Restore completed.
goto end

:end
echo Operation completed.
pause
