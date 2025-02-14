@echo off
echo Installing Flutter dependencies...
flutter pub get

echo.
echo Checking Flutter setup...
flutter doctor

echo.
echo Running the app...
flutter run

pause 