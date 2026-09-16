@echo off
cd /d "%~dp0"

if not exist "SoundVolumeView.exe" (
    echo [ERROR] SoundVolumeView.exe was not found in: %cd%
    echo Extract SoundVolumeView.exe to this folder first.
    pause
    exit /b
)

:: Mutes or unmutes the default microphone endpoint specifically
SoundVolumeView.exe /Switch "Microphone"

if %errorlevel% equ 0 (
    echo Microphone mute state toggled successfully!
) else (
    echo Command failed. Check device name in Sound Control Panel.
)

timeout /t 2
