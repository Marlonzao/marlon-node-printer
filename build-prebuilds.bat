@echo off
REM Build prebuilds for node-printer with Electron 36.9.5 support
echo Building prebuilds for Electron 36.9.5...

REM Clean previous builds
if exist prebuilds rmdir /s /q prebuilds
mkdir prebuilds

REM Build for Electron 36.9.5 (ABI 135) - Windows x64
echo Building for Windows x64...
call npm run prebuild -- --runtime electron --target 36.9.5 --arch x64

REM Build for Windows ia32 (optional)
echo.
echo Building for Windows ia32...
call npm run prebuild -- --runtime electron --target 36.9.5 --arch ia32

echo.
echo Build complete! Prebuilds are in the 'prebuilds' directory:
dir prebuilds

echo.
echo To upload to GitHub releases, run:
echo gh release upload v0.6.3 prebuilds/*.tar.gz
