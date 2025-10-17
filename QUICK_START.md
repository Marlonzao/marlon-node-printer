# Quick Start: Build node-printer for Electron 29.4.6

## Step 1: Install Visual Studio Build Tools (REQUIRED)

1. Download **Build Tools for Visual Studio 2022**:
   - Link: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022
   - Scroll down to "Tools for Visual Studio" section
   - Download "Build Tools for Visual Studio 2022"

2. Run the installer
3. Select "**Desktop development with C++**" workload
4. Click Install (this will take 10-15 minutes)

## Step 2: Add Python to PATH (If not already done)

If `python --version` doesn't work in CMD:

1. Find where Python is installed (usually `C:\Users\marlon\AppData\Local\Programs\Python\Python3XX\`)
2. Add to system PATH:
   - Press Windows + R
   - Type `sysdm.cpl` and press Enter
   - Go to "Advanced" tab → "Environment Variables"
   - Under "System variables", find "Path" and click "Edit"
   - Click "New" and add your Python path (e.g., `C:\Python311\`)
   - Click "New" again and add `C:\Python311\Scripts\`
   - Click OK on all dialogs

OR use this PowerShell command (Run as Administrator):
```powershell
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Python311\;C:\Python311\Scripts\", "Machine")
```

3. **Restart your terminal** after adding to PATH

## Step 3: Build the Prebuilds

Open a **NEW** Command Prompt or PowerShell (after installing the tools above):

```bash
# Navigate to node-printer directory
cd C:\Users\marlon\marlon-node-printer

# Install dependencies
npm install

# Build for Electron 29.4.6
npm run prebuild -- --runtime electron --target 29.4.6 --arch x64
```

For 32-bit as well:
```bash
npm run prebuild -- --runtime electron --target 29.4.6 --arch ia32
```

## Step 4: Upload to GitHub

```bash
# Using GitHub CLI
gh release upload v0.6.3 prebuilds/node-printer-v0.6.3-electron-v121-win32-x64.tar.gz

# Or manually:
# Go to https://github.com/last-tech/node-printer/releases/tag/v0.6.3
# Edit the release and upload the files from prebuilds/ folder
```

## Troubleshooting

### "Python not found" error
- Make sure Python is in PATH (Step 2)
- Restart terminal after adding to PATH
- Verify with: `python --version`

### "MSBuild not found" error
- Make sure you installed Visual Studio Build Tools 2022 with C++ workload
- Restart terminal after installation

### Still having issues?
Set Python path manually for npm:
```bash
npm config set python "C:\Python311\python.exe"
```

Set Visual Studio version:
```bash
npm config set msvs_version 2022
```
