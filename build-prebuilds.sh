#!/bin/bash
# Build prebuilds for node-printer with Electron 36.9.5 support
set -e

echo "Building prebuilds for Electron 36.9.5..."

# Clean previous builds
rm -rf prebuilds
mkdir -p prebuilds

# Build for Electron 36.9.5 (ABI 135) - Windows x64
echo "Building for Windows x64..."
npm run prebuild -- --runtime electron --target 36.9.5 --arch x64

# Build for Windows ia32 (optional)
echo ""
echo "Building for Windows ia32..."
npm run prebuild -- --runtime electron --target 36.9.5 --arch ia32

echo ""
echo "Build complete! Prebuilds are in the 'prebuilds' directory:"
ls -lh prebuilds/

echo ""
echo "To upload to GitHub releases, run:"
echo "gh release upload v0.6.3 prebuilds/*.tar.gz"
