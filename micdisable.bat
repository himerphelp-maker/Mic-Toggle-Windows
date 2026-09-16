@echo off
:: Automatically request Administrator privileges if not elevated
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set MIC_NAME=YOUR MICROPHONE NAME

:: Query current device status via PowerShell
for /f "tokens=*" %%A in ('powershell -Command "(Get-PnpDevice -FriendlyName '%MIC_NAME%').Status"') do set MIC_STATUS=%%A

if "%MIC_STATUS%"=="OK" (
    echo Microphone is currently ENABLED. Disabling...
    powershell -Command "Get-PnpDevice -FriendlyName '%MIC_NAME%' | Disable-PnpDevice -Confirm:$false"
    echo Microphone has been DISABLED.
) else (
    echo Microphone is currently DISABLED. Enabling...
    powershell -Command "Get-PnpDevice -FriendlyName '%MIC_NAME%' | Enable-PnpDevice -Confirm:$false"
    echo Microphone has been ENABLED.
)

timeout /t 3
