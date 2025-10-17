# Building node-printer for Electron 36.9.5

## Prerequisites

### 1. Install Python
1. Download Python 3.11+ from https://www.python.org/downloads/
2. **IMPORTANT**: Check "Add Python to PATH" during installation
3. Verify installation:
   ```bash
   python --version
   ```

### 2. Install Visual Studio Build Tools

**Option A: Using npm (Easier)**
```bash
npm install --global windows-build-tools
```

**Option B: Manual Installation (Recommended)**
1. Download from: https://visualstudio.microsoft.com/downloads/
2. Select "Build Tools for Visual Studio 2022"
3. In the installer, select "Desktop development with C++"
4. Install

### 3. Verify node-gyp
```bash
npm install --global node-gyp
node-gyp --version
```

## Building the Prebuilds

### Method 1: Using the Build Script

Run the build script:
```bash
# On Windows CMD or PowerShell
.\build-prebuilds.bat

# On Git Bash or WSL
bash build-prebuilds.sh
```

### Method 2: Manual Build

```bash
# Install dependencies
npm install

# Build for Electron 36.9.5 x64
npm run prebuild -- --runtime electron --target 36.9.5 --arch x64

# Build for Electron 36.9.5 ia32 (optional)
npm run prebuild -- --runtime electron --target 36.9.5 --arch ia32
```

## Expected Output

After building, you should see files in `prebuilds/`:
- `node-printer-v0.6.3-electron-v135-win32-x64.tar.gz`
- `node-printer-v0.6.3-electron-v135-win32-ia32.tar.gz`

## Uploading to GitHub Releases

### Option 1: Using GitHub CLI (gh)
```bash
# Make sure you're authenticated
gh auth login

# Upload to release v0.6.3
gh release upload v0.6.3 prebuilds/*.tar.gz
```

### Option 2: Manual Upload
1. Go to https://github.com/last-tech/node-printer/releases/tag/v0.6.3
2. Click "Edit release"
3. Drag and drop the `.tar.gz` files from `prebuilds/` folder
4. Click "Update release"

## Testing the Build

To test locally before uploading:

1. Copy the prebuild to your project:
   ```bash
   cp prebuilds/*.tar.gz node_modules/@lastapp/node-printer/prebuilds/
   ```

2. Test in your Electron app:
   ```bash
   npm test
   # or run your Electron app
   ```

## Troubleshooting

### Python not found
- Ensure Python is in PATH
- Restart terminal after Python installation
- Set manually: `npm config set python "C:\Path\To\python.exe"`

### Visual Studio Build Tools not found
- Install as per prerequisites
- Or set manually: `npm config set msvs_version 2022`

### node-gyp errors
- Try: `npm install --global node-gyp@latest`
- Clear cache: `node-gyp clean`
