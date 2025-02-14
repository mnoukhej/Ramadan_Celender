@echo off
setlocal enabledelayedexpansion

echo Checking Flutter installation...
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo Flutter is not installed or not in PATH
    echo Please install Flutter and add it to your PATH
    pause
    exit /b 1
)

echo.
echo Checking connected devices...
flutter devices > devices.txt
find /c "No devices" devices.txt >nul
if %errorlevel% equ 0 (
    echo No devices found. Please connect a device or start an emulator.
    del devices.txt
    pause
    exit /b 1
)
del devices.txt

echo.
echo Installing Flutter dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo Checking Flutter setup...
flutter doctor
if %errorlevel% neq 0 (
    echo Warning: There might be some issues with Flutter setup
    echo Continue anyway? (Y/N)
    set /p continue=
    if /i "!continue!" neq "Y" (
        pause
        exit /b 1
    )
)

echo.
echo Building and running the app...
flutter run
if %errorlevel% neq 0 (
    echo Failed to run the app
    pause
    exit /b 1
)

pause 