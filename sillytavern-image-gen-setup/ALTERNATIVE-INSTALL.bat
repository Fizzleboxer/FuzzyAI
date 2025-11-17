@echo off
REM Alternative Batch Installer for Stable Diffusion Forge
REM Use this if the PowerShell script doesn't work
REM Optimized for RTX 2080 Ti

echo ============================================
echo SD Forge Installer (Batch Version)
echo Optimized for RTX 2080 Ti
echo ============================================
echo.

REM Check for Git
echo Checking for Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git not found!
    echo Please install Git from: https://git-scm.com/download/win
    echo After installation, restart this script.
    pause
    exit /b 1
)
echo [OK] Git found

REM Check for Python
echo Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found!
    echo Please install Python 3.10.x from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation!
    pause
    exit /b 1
)
echo [OK] Python found
echo.

REM Set installation directory
set INSTALL_DIR=C:\SD-Forge
echo Installation directory: %INSTALL_DIR%
echo.

REM Create directory
if not exist "%INSTALL_DIR%" (
    echo Creating directory...
    mkdir "%INSTALL_DIR%"
    echo [OK] Directory created
) else (
    echo [OK] Directory already exists
)
echo.

REM Clone Forge
set FORGE_DIR=%INSTALL_DIR%\stable-diffusion-webui-forge
if not exist "%FORGE_DIR%" (
    echo Cloning Stable Diffusion WebUI Forge...
    echo This will take several minutes...
    echo.
    cd /d "%INSTALL_DIR%"
    git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to clone repository!
        pause
        exit /b 1
    )
    echo [OK] Clone complete
) else (
    echo [OK] Forge already exists, skipping clone
)
echo.

REM Create optimized launch script
echo Creating optimized launch configuration...
(
echo @echo off
echo.
echo set PYTHON=
echo set GIT=
echo set VENV_DIR=
echo set COMMANDLINE_ARGS=--xformers --api --medvram --opt-sdp-attention --no-half-vae --enable-insecure-extension-access
echo.
echo call webui.bat
) > "%FORGE_DIR%\webui-user.bat"
echo [OK] Launch script created
echo.

REM Create quick start shortcut
echo Creating quick start script...
(
echo @echo off
echo echo ============================================
echo echo Starting Stable Diffusion WebUI Forge
echo echo Optimized for RTX 2080 Ti
echo echo ============================================
echo echo.
echo echo API will be available at: http://127.0.0.1:7860
echo echo.
echo cd /d "%FORGE_DIR%"
echo call webui-user.bat
) > "%INSTALL_DIR%\START-SD-FORGE.bat"
echo [OK] Quick start created
echo.

REM Create models directory
set MODELS_DIR=%FORGE_DIR%\models\Stable-diffusion
if not exist "%MODELS_DIR%" (
    mkdir "%MODELS_DIR%"
)
echo [OK] Models directory ready
echo.

echo ============================================
echo Installation Complete!
echo ============================================
echo.
echo Next Steps:
echo 1. Download NSFW models from CivitAI
echo    Place them in: %MODELS_DIR%
echo.
echo 2. Run: %INSTALL_DIR%\START-SD-FORGE.bat
echo.
echo 3. Wait for first-time setup (5-10 minutes)
echo.
echo 4. Access at: http://127.0.0.1:7860
echo.
echo 5. Configure SillyTavern (see sillytavern-config.txt)
echo.
echo Installation location: %INSTALL_DIR%
echo.
pause
