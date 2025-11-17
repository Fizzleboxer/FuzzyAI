# Stable Diffusion WebUI Forge Installer for SillyTavern
# Optimized for NVIDIA RTX 2080 Ti (11GB VRAM)
# Supports NSFW image generation

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "SD WebUI Forge Installer for SillyTavern" -ForegroundColor Cyan
Write-Host "Optimized for RTX 2080 Ti (11GB VRAM)" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "Warning: Not running as Administrator. Some operations may fail." -ForegroundColor Yellow
    Write-Host "Consider running PowerShell as Administrator for best results." -ForegroundColor Yellow
    Write-Host ""
}

# Set installation directory
$installDir = "C:\SD-Forge"
Write-Host "Installation directory: $installDir" -ForegroundColor Green

# Check if Git is installed
Write-Host "Checking for Git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "✓ Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git not found!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Red
    Write-Host "After installing Git, restart PowerShell and run this script again." -ForegroundColor Yellow
    pause
    exit 1
}

# Check if Python is installed
Write-Host "Checking for Python..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python not found!" -ForegroundColor Red
    Write-Host "Please install Python 3.10.x from: https://www.python.org/downloads/" -ForegroundColor Red
    Write-Host "Make sure to check 'Add Python to PATH' during installation!" -ForegroundColor Yellow
    pause
    exit 1
}

# Create installation directory
Write-Host ""
Write-Host "Creating installation directory..." -ForegroundColor Yellow
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    Write-Host "✓ Directory created: $installDir" -ForegroundColor Green
} else {
    Write-Host "✓ Directory already exists: $installDir" -ForegroundColor Green
}

# Clone Stable Diffusion WebUI Forge
Write-Host ""
Write-Host "Cloning Stable Diffusion WebUI Forge..." -ForegroundColor Yellow
Write-Host "This may take a few minutes..." -ForegroundColor Cyan

$forgeDir = "$installDir\stable-diffusion-webui-forge"
if (-not (Test-Path $forgeDir)) {
    try {
        Set-Location $installDir
        git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
        Write-Host "✓ Forge cloned successfully!" -ForegroundColor Green
    } catch {
        Write-Host "✗ Failed to clone Forge repository!" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
        pause
        exit 1
    }
} else {
    Write-Host "✓ Forge already exists, skipping clone" -ForegroundColor Green
}

# Create optimized launch script
Write-Host ""
Write-Host "Creating optimized launch script for RTX 2080 Ti..." -ForegroundColor Yellow

$launchScript = @"
@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--xformers --api --medvram --opt-sdp-attention --no-half-vae --enable-insecure-extension-access

call webui.bat
"@

$launchScriptPath = "$forgeDir\webui-user.bat"
Set-Content -Path $launchScriptPath -Value $launchScript -Force
Write-Host "✓ Launch script created: webui-user.bat" -ForegroundColor Green

# Create models directory structure
Write-Host ""
Write-Host "Creating models directory structure..." -ForegroundColor Yellow
$modelsDir = "$forgeDir\models\Stable-diffusion"
if (-not (Test-Path $modelsDir)) {
    New-Item -ItemType Directory -Path $modelsDir -Force | Out-Null
}
Write-Host "✓ Models directory ready: $modelsDir" -ForegroundColor Green

# Create quick start script
Write-Host ""
Write-Host "Creating quick start script..." -ForegroundColor Yellow

$quickStart = @"
@echo off
echo ============================================
echo Starting Stable Diffusion WebUI Forge
echo Optimized for RTX 2080 Ti
echo ============================================
echo.
echo API will be available at: http://127.0.0.1:7860
echo.
cd /d "$forgeDir"
call webui-user.bat
"@

$quickStartPath = "$installDir\START-SD-FORGE.bat"
Set-Content -Path $quickStartPath -Value $quickStart -Force
Write-Host "✓ Quick start script created: START-SD-FORGE.bat" -ForegroundColor Green

# Installation complete
Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "Installation Complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Download NSFW models (see model-download-links.txt)" -ForegroundColor White
Write-Host "   Place them in: $modelsDir" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Run: $quickStartPath" -ForegroundColor White
Write-Host "   OR navigate to: $forgeDir" -ForegroundColor Gray
Write-Host "   And run: webui-user.bat" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Wait for first-time setup (downloads models/dependencies)" -ForegroundColor White
Write-Host ""
Write-Host "4. Access WebUI at: http://127.0.0.1:7860" -ForegroundColor White
Write-Host ""
Write-Host "5. Configure SillyTavern (see sillytavern-config.txt)" -ForegroundColor White
Write-Host ""
Write-Host "Installation location: $installDir" -ForegroundColor Cyan
Write-Host ""
pause
