# Stable Diffusion WebUI Forge - Windows Setup (Uncensored)

## For Your Windows Installation
**Location**: `C:\Users\ussol\Desktop\stable-diffusion-webui-forge-main`

## Quick Setup Instructions

### Step 1: Edit webui-user.bat

1. **Navigate to**: `C:\Users\ussol\Desktop\stable-diffusion-webui-forge-main`
2. **Right-click** `webui-user.bat` → **Edit** (or open with Notepad)
3. **Find the line** that starts with `set COMMANDLINE_ARGS=`
4. **Replace it with**:
   ```batch
   set COMMANDLINE_ARGS=--listen --enable-insecure-extension-access --api --xformers --disable-safe-unpickle
   ```
5. **Save** the file (Ctrl+S)

### Step 2: Create start-uncensored.bat (Optional)

Create a new file called `start-uncensored.bat` in the same folder with this content:

```batch
@echo off
:: Stable Diffusion WebUI Forge - Uncensored Configuration
echo ===========================================
echo Stable Diffusion WebUI Forge
echo Uncensored Configuration
echo ===========================================
echo.
echo Starting with uncensored settings...
echo - No content filtering
echo - No safety checks
echo - API enabled
echo - Network access enabled
echo.

cd /d "%~dp0"

if not exist "models\Stable-diffusion" (
    echo WARNING: models\Stable-diffusion directory not found!
    echo Download models and place in: models\Stable-diffusion\
    echo.
)

set COMMANDLINE_ARGS=--listen --enable-insecure-extension-access --api --xformers --disable-safe-unpickle

call webui-user.bat

echo.
echo WebUI stopped.
pause
```

### Step 3: Launch

**Option A**: Double-click `start-uncensored.bat` (if you created it)
**Option B**: Double-click `webui-user.bat` (after editing it)
**Option C**: In PowerShell:
```powershell
cd C:\Users\ussol\Desktop\stable-diffusion-webui-forge-main
.\webui-user.bat
```

### First Run (15-30 minutes)

The first time you run it, it will:
1. Install Python dependencies
2. Download PyTorch (large download)
3. Set up the environment
4. Launch the WebUI at http://localhost:7860

**Be patient** - this is a one-time setup!

### Step 4: Download Models

You **must** download Stable Diffusion models before you can generate images.

**Where to put them**:
```
C:\Users\ussol\Desktop\stable-diffusion-webui-forge-main\models\Stable-diffusion\
```

**Where to get them**:
- **Civitai**: https://civitai.com/ (tons of uncensored models)
  - Realistic Vision
  - DreamShaper
  - Deliberate
  - Anything V5 (anime)

- **Hugging Face**: https://huggingface.co/models
  - Stable Diffusion 1.5: https://huggingface.co/runwayml/stable-diffusion-v1-5
  - SDXL: https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0

**File types**: `.safetensors` or `.ckpt`

### Configuration Explained

The command line arguments enable uncensored operation:

- `--listen` - Allows access from other devices on network
- `--enable-insecure-extension-access` - Full extension support
- `--api` - Enables REST API at http://localhost:7860/docs
- `--xformers` - Better performance (memory efficient)
- `--disable-safe-unpickle` - Load any model files without restrictions

**Important**: Stable Diffusion WebUI Forge does **NOT** include any built-in NSFW filters or safety checkers. It's uncensored by default!

### Using the WebUI

1. **Open browser**: http://localhost:7860
2. **Select model**: Top dropdown menu
3. **Enter prompt**: Main text box
4. **Adjust settings** (optional):
   - Image size (512x512 for SD1.5, 1024x1024 for SDXL)
   - Sampling steps (20-30 recommended)
   - CFG Scale (7-10 recommended)
5. **Click "Generate"**

### Recommended Settings for Different GPUs

**6GB VRAM or less**:
```batch
set COMMANDLINE_ARGS=--listen --api --xformers --medvram --disable-safe-unpickle
```

**4GB VRAM**:
```batch
set COMMANDLINE_ARGS=--listen --api --xformers --lowvram --disable-safe-unpickle
```

**8GB+ VRAM** (use original settings):
```batch
set COMMANDLINE_ARGS=--listen --enable-insecure-extension-access --api --xformers --disable-safe-unpickle
```

### API Usage

Once running, the API is available at:
- **Docs**: http://localhost:7860/docs
- **txt2img endpoint**: http://localhost:7860/sdapi/v1/txt2img
- **img2img endpoint**: http://localhost:7860/sdapi/v1/img2img

**Example Python code**:
```python
import requests
import json
import base64

url = "http://localhost:7860/sdapi/v1/txt2img"

payload = {
    "prompt": "a beautiful sunset over mountains",
    "negative_prompt": "blurry, bad quality",
    "steps": 20,
    "width": 512,
    "height": 512,
    "cfg_scale": 7
}

response = requests.post(url, json=payload)
result = response.json()

# Save image
with open("output.png", "wb") as f:
    f.write(base64.b64decode(result['images'][0]))
```

### Troubleshooting

**"CUDA out of memory"**
- Add `--medvram` or `--lowvram` to COMMANDLINE_ARGS
- Reduce image size to 512x512
- Lower sampling steps to 20

**"No module named torch"**
- First run installs PyTorch automatically
- Wait for installation to complete (15-30 min)

**"Cannot find model"**
- Download models to `models\Stable-diffusion\`
- Restart WebUI after adding models
- Check file format (.safetensors or .ckpt)

**WebUI won't open**
- Check console for errors
- Wait 2-3 minutes after "Running on local URL: http://127.0.0.1:7860"
- Try http://127.0.0.1:7860 instead of localhost

**Slow generation**
- Normal for first image (model loading)
- Reduce image size
- Lower sampling steps
- Use faster samplers (DPM++ 2M)

### Extensions

Forge includes ControlNet by default. To add more:
1. Open WebUI → **Extensions** tab
2. **Available** subtab
3. **Load from** list
4. Find extension → **Install**
5. **Restart** WebUI

**Popular extensions**:
- Dynamic Prompts
- Ultimate SD Upscale
- Regional Prompter
- Infinite Image Browser

### Safety & Legal

This setup is completely uncensored. You are responsible for:
- Following local laws
- Respecting copyright
- Ethical use of generated content
- Not creating illegal material

All generation is **100% local** - nothing is sent to external servers.

### System Requirements

**Minimum**:
- GPU: NVIDIA GTX 1060 6GB or better
- RAM: 16GB
- Storage: 20GB free
- Windows 10/11

**Recommended**:
- GPU: RTX 3060 12GB or better
- RAM: 32GB
- Storage: 50GB+ free
- Fast internet for model downloads

### Updates

To update Forge:
1. Open PowerShell in forge directory
2. Run:
   ```powershell
   git pull
   .\webui-user.bat --update
   ```

### Additional Resources

- **Official Repo**: https://github.com/lllyasviel/stable-diffusion-webui-forge
- **Model Library**: https://civitai.com/
- **Community Guide**: https://stable-diffusion-art.com/
- **Reddit**: r/StableDiffusion

### Quick Reference Commands

**Normal launch**:
```batch
webui-user.bat
```

**With extra memory optimization**:
```batch
set COMMANDLINE_ARGS=--medvram --listen --api --xformers
webui-user.bat
```

**Update Forge**:
```batch
git pull
webui-user.bat --update
```

---

## Summary

1. ✅ Edit `webui-user.bat` with uncensored settings
2. ✅ Run `webui-user.bat`
3. ✅ Wait for installation (first time only)
4. ✅ Download models to `models\Stable-diffusion\`
5. ✅ Open http://localhost:7860
6. ✅ Generate without restrictions!

**No filters. No censorship. Complete freedom.** 🎨
