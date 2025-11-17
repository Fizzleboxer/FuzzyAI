============================================
SILLYTAVERN IMAGE GENERATION SETUP
Optimized for NVIDIA RTX 2080 Ti (11GB)
NSFW Support Enabled
============================================

This package contains everything you need to set up image generation
for SillyTavern on Windows with your RTX 2080 Ti GPU.


WHAT'S INCLUDED
===============
✓ Automated installer (PowerShell script)
✓ Optimized configuration for RTX 2080 Ti
✓ Model download links and recommendations
✓ SillyTavern configuration guide
✓ Troubleshooting tips


SYSTEM REQUIREMENTS
===================
✓ Windows 10/11
✓ NVIDIA RTX 2080 Ti (11GB VRAM)
✓ ~20GB free disk space (for software + 1-2 models)
✓ Python 3.10.x (will guide you to install if missing)
✓ Git (will guide you to install if missing)


QUICK START (5 STEPS)
======================

STEP 1: INSTALL PREREQUISITES
------------------------------
If you don't have Python and Git installed:

1. Download Python 3.10.11:
   https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

   During installation:
   ☑ Check "Add Python to PATH"
   ☑ Check "Install pip"

2. Download Git:
   https://git-scm.com/download/win

   Use default settings during installation

3. Restart your computer after installing both


STEP 2: RUN THE INSTALLER
--------------------------
1. Copy this entire folder to your desktop or C:\ drive

2. Right-click on "install-sd-forge.ps1"

3. Select "Run with PowerShell"

   ⚠️ If you get an error about execution policy, run this first:
   - Right-click PowerShell and "Run as Administrator"
   - Type: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   - Press Y and Enter
   - Close PowerShell and try step 3 again

4. The installer will:
   - Check for Python and Git
   - Download Stable Diffusion WebUI Forge (~2GB)
   - Create optimized configuration for your 2080 Ti
   - Set up launch scripts

   This takes 10-20 minutes depending on your internet speed.

5. When complete, you'll see installation summary and next steps


STEP 3: DOWNLOAD A MODEL
-------------------------
You MUST download at least one model to generate images.

For beginners, we recommend PONY DIFFUSION XL:
1. Go to: https://civitai.com/models/257749/pony-diffusion-v6-xl
2. Create a free account (required)
3. Enable "Show NSFW" in your account settings
4. Download the latest version (.safetensors file, ~6-7GB)
5. Place it in: C:\SD-Forge\stable-diffusion-webui-forge\models\Stable-diffusion\

See "model-download-links.txt" for more options and details.


STEP 4: START STABLE DIFFUSION
-------------------------------
1. Double-click: C:\SD-Forge\START-SD-FORGE.bat

2. First launch will take 5-10 minutes (downloads dependencies)

3. Wait until you see: "Running on local URL: http://127.0.0.1:7860"

4. KEEP THIS WINDOW OPEN while using SillyTavern

5. (Optional) Open http://127.0.0.1:7860 in browser to test


STEP 5: CONFIGURE SILLYTAVERN
------------------------------
See "sillytavern-config.txt" for detailed instructions.

Quick version:
1. Open SillyTavern
2. Extensions → Image Generation
3. Source: Stable Diffusion
4. API URL: http://127.0.0.1:7860
5. Select your model from dropdown
6. Click "Test" then "Save Settings"

Done! Try typing: /image beautiful landscape


DETAILED GUIDES
===============
📄 sillytavern-config.txt    - Complete SillyTavern setup guide
📄 model-download-links.txt  - Model recommendations and download links
📄 install-sd-forge.ps1      - Automated installer script


FILE LOCATIONS (After Installation)
====================================
Installation:     C:\SD-Forge\stable-diffusion-webui-forge\
Models:           C:\SD-Forge\stable-diffusion-webui-forge\models\Stable-diffusion\
Generated images: C:\SD-Forge\stable-diffusion-webui-forge\outputs\
Quick launcher:   C:\SD-Forge\START-SD-FORGE.bat


PERFORMANCE EXPECTATIONS (RTX 2080 Ti)
=======================================
SDXL Models (1024x1024):
- Pony Diffusion XL: ~20-30 seconds per image
- AutismMix SDXL: ~20-30 seconds per image

SD 1.5 Models (512x512):
- Deliberate: ~5-10 seconds per image
- Realistic Vision: ~5-10 seconds per image

Your 2080 Ti is powerful enough for excellent NSFW generation!


OPTIMIZATIONS INCLUDED
=======================
The installer configures these optimizations for your 2080 Ti:

--xformers              = Faster generation with less VRAM
--medvram               = Prevents out-of-memory errors
--opt-sdp-attention     = Better memory efficiency
--no-half-vae           = Better image quality
--api                   = Enables SillyTavern connection

You don't need to change these - they're already optimized!


TROUBLESHOOTING
===============

"Python not found"
→ Install Python 3.10.11 from link above
→ Make sure "Add to PATH" is checked during install
→ Restart computer

"Git not found"
→ Install Git from link above
→ Restart computer

"Out of memory" errors
→ Close other GPU applications (games, browsers with hardware acceleration)
→ Reduce image size to 512x512
→ Use SD 1.5 models instead of SDXL

"Connection failed" in SillyTavern
→ Make sure Forge is running (START-SD-FORGE.bat)
→ Check that you see "Running on local URL: http://127.0.0.1:7860"
→ Try opening http://127.0.0.1:7860 in browser to verify it works
→ Check API URL in SillyTavern is exactly: http://127.0.0.1:7860

Images are low quality
→ Increase sampling steps to 30-40
→ Try different samplers (DPM++ 2M Karras)
→ Improve your prompts (be more detailed)
→ Try a different model

Images are too slow
→ Reduce image size (try 512x512)
→ Reduce steps to 20
→ Use SD 1.5 models instead of SDXL
→ Close other applications


USAGE TIPS
==========

In SillyTavern chat:
- /image <prompt> - Generate single image
- Enable "Auto-generate" - Creates images from chat context

Good prompt structure:
"masterpiece, best quality, [subject], [details], [style], [lighting]"

Example:
"/image masterpiece, best quality, 1girl, long black hair, red eyes,
elegant gothic dress, moonlight, detailed face, anime style"

Always use negative prompts:
"low quality, worst quality, bad anatomy, blurry, watermark"


NSFW GENERATION
===============
✓ All recommended models support NSFW content
✓ No safety filters are enabled in Forge
✓ Be detailed and specific in prompts for best results
✓ Pony Diffusion XL is highly recommended for NSFW
✓ Use appropriate tags for your desired content


UPGRADING LATER
================

To update Forge:
1. Open PowerShell in: C:\SD-Forge\stable-diffusion-webui-forge\
2. Run: git pull
3. Run: START-SD-FORGE.bat

To add more models:
1. Download from CivitAI or Hugging Face
2. Place in: C:\SD-Forge\stable-diffusion-webui-forge\models\Stable-diffusion\
3. Restart Forge


UNINSTALLING
============
Simply delete the C:\SD-Forge\ folder.
No registry entries or system changes are made.


ADDITIONAL RESOURCES
====================
CivitAI (models):        https://civitai.com/
Hugging Face (models):   https://huggingface.co/
Stable Diffusion Reddit: https://reddit.com/r/StableDiffusion/
Prompt guide:            https://prompthero.com/stable-diffusion-prompt-guide


SUPPORT
=======
For SillyTavern issues:  https://github.com/SillyTavern/SillyTavern
For Forge issues:        https://github.com/lllyasviel/stable-diffusion-webui-forge
For model questions:     https://civitai.com/ (model comments/discussions)


============================================
IMPORTANT NOTES
============================================

⚠️ Keep Forge running while using image generation in SillyTavern

⚠️ First launch takes 5-10 minutes to download dependencies

⚠️ You need at least ONE model downloaded to generate images

⚠️ NSFW content is your responsibility - follow local laws

⚠️ Close GPU-intensive apps while generating for best performance

⚠️ Generated images are saved in the outputs folder


============================================
Enjoy your NSFW image generation! 🎨
============================================

Questions? Check the detailed guides included in this package:
- sillytavern-config.txt (SillyTavern setup)
- model-download-links.txt (Model recommendations)

Installation created: 2025
Optimized for: NVIDIA RTX 2080 Ti (11GB VRAM)
Backend: Stable Diffusion WebUI Forge
Compatible with: SillyTavern, Automatic1111-compatible tools
