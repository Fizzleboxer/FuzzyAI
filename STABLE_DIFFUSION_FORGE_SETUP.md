# Stable Diffusion WebUI Forge - Uncensored Setup Guide

## Overview

This document describes the setup of Stable Diffusion WebUI Forge for uncensored image generation on this system.

## Installation Location

The Stable Diffusion WebUI Forge has been installed at:
```
/home/user/stable-diffusion-webui-forge/
```

## Key Features

✅ **No Content Filtering** - Forge doesn't include safety checkers or NSFW filters by default
✅ **Uncensored Generation** - All content types can be generated without restrictions
✅ **API Enabled** - Full API access for programmatic image generation
✅ **Network Access** - Accessible from other devices on the network
✅ **Optimized Configuration** - Pre-configured for best performance

## What Was Configured

### 1. Repository Cloned
The official Stable Diffusion WebUI Forge repository has been cloned from:
- https://github.com/lllyasviel/stable-diffusion-webui-forge

### 2. Launch Configuration (`webui-user.sh`)
The following command-line arguments have been configured:
- `--listen` - Enables network access (binds to 0.0.0.0)
- `--enable-insecure-extension-access` - Full extension access
- `--api` - Enables REST API endpoints
- `--xformers` - Memory-efficient attention for better performance
- `--disable-safe-unpickle` - Allows loading any model files

### 3. Quick-Start Script
A convenience script has been created: `start-uncensored.sh`

### 4. Documentation Created
- `SETUP_UNCENSORED.md` - Comprehensive setup and usage guide
- `QUICKSTART.md` - Quick reference guide for getting started
- This file - Integration documentation

## Quick Start

### Option 1: Use the convenience script
```bash
cd /home/user/stable-diffusion-webui-forge
./start-uncensored.sh
```

### Option 2: Standard launch
```bash
cd /home/user/stable-diffusion-webui-forge
./webui.sh
```

### First-Time Setup
On first run, the script will:
1. Create a Python virtual environment
2. Install PyTorch and all dependencies
3. Download necessary configurations
4. Start the WebUI server

**Estimated time**: 15-30 minutes (depending on internet speed)

## Post-Installation Steps

### 1. Download Models
You need to download Stable Diffusion models:

```bash
cd /home/user/stable-diffusion-webui-forge/models/Stable-diffusion
# Download your preferred model
wget <model-url>
```

**Recommended sources**:
- **Civitai**: https://civitai.com/ (many community models, including uncensored)
- **Hugging Face**: https://huggingface.co/models

**Popular model types**:
- SD 1.5 - Base model, fast, 4GB
- SDXL - Higher quality, slower, 6-7GB
- Custom fine-tuned models - Various styles

### 2. Access the WebUI
Once running, access at:
- **Local**: http://localhost:7860
- **Network**: http://<server-ip>:7860
- **API Docs**: http://localhost:7860/docs

### 3. Generate Images
1. Select a model from the dropdown
2. Enter your prompt
3. Configure settings (optional)
4. Click "Generate"

## Important Notes

### No Safety Filters
Stable Diffusion WebUI Forge does NOT include:
- NSFW filters
- Safety checkers
- Content moderation
- Prompt filtering

This means you have complete freedom in what you generate, but also complete responsibility.

### Legal & Ethical Considerations
Users are responsible for:
- Complying with local laws and regulations
- Respecting copyright and intellectual property
- Using the tool ethically and responsibly
- Not generating illegal content

## Configuration Files

### Main Configuration
- **Launch config**: `/home/user/stable-diffusion-webui-forge/webui-user.sh`
- **UI settings**: `/home/user/stable-diffusion-webui-forge/ui-config.json` (created on first run)
- **User settings**: `/home/user/stable-diffusion-webui-forge/config.json` (created on first run)

### Model Directories
- **Checkpoints**: `models/Stable-diffusion/`
- **VAE**: `models/VAE/`
- **LoRAs**: `models/Lora/`
- **ControlNet**: `models/ControlNet/`
- **Embeddings**: `embeddings/`

## API Integration

### Example: Generate Image via API
```python
import requests
import json
import base64

url = "http://localhost:7860/sdapi/v1/txt2img"

payload = {
    "prompt": "a beautiful landscape",
    "negative_prompt": "blurry, bad quality",
    "steps": 20,
    "width": 512,
    "height": 512,
    "cfg_scale": 7
}

response = requests.post(url, json=payload)
result = response.json()

# Save generated image
with open("output.png", "wb") as f:
    f.write(base64.b64decode(result['images'][0]))
```

### API Endpoints
- `/sdapi/v1/txt2img` - Generate from text
- `/sdapi/v1/img2img` - Generate from image
- `/sdapi/v1/sd-models` - List available models
- `/sdapi/v1/samplers` - List samplers
- Full docs at: http://localhost:7860/docs

## Performance Optimization

### For Limited VRAM (4-8GB)
Edit `webui-user.sh` and add:
```bash
export COMMANDLINE_ARGS="--listen --api --xformers --medvram"
```

### For Very Limited VRAM (4GB)
```bash
export COMMANDLINE_ARGS="--listen --api --xformers --lowvram"
```

### For Maximum Speed
- Use smaller models (SD 1.5 instead of SDXL)
- Use DPM++ 2M sampler
- Reduce steps to 20-25
- Use lower resolutions (512x512)

## Troubleshooting

### CUDA Out of Memory
- Add `--medvram` or `--lowvram` flag
- Reduce image resolution
- Use smaller models

### Slow Generation
- Enable xformers (already enabled)
- Use faster samplers (DPM++ 2M)
- Reduce sampling steps
- Lower image resolution

### Models Not Loading
- Verify files are in `models/Stable-diffusion/`
- Check file permissions
- Ensure models are `.safetensors` or `.ckpt` format

## System Requirements

### Minimum
- GPU: NVIDIA with 6GB VRAM
- RAM: 16GB
- Storage: 20GB free
- OS: Linux (installed), Windows, macOS

### Recommended
- GPU: NVIDIA with 8GB+ VRAM
- RAM: 32GB
- Storage: 50GB+ free
- Fast internet for model downloads

## Additional Resources

### Documentation
- Full setup guide: `/home/user/stable-diffusion-webui-forge/SETUP_UNCENSORED.md`
- Quick start: `/home/user/stable-diffusion-webui-forge/QUICKSTART.md`

### External Links
- Official Forge Repo: https://github.com/lllyasviel/stable-diffusion-webui-forge
- Forge Discussions: https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions
- Model Downloads: https://civitai.com/
- Community Guides: https://stable-diffusion-art.com/

## Extensions

Forge includes ControlNet and supports many extensions:
- Dynamic Prompts
- Ultimate SD Upscale
- Regional Prompter
- And many more

Install from the Extensions tab in the WebUI.

## Updates

To update Forge:
```bash
cd /home/user/stable-diffusion-webui-forge
git pull
./webui.sh --update
```

## Support

- Check terminal output for errors
- Review logs in the console
- Visit official Forge discussions
- Consult documentation files

---

**Setup completed**: November 20, 2025
**Installed by**: Claude
**Branch**: claude/setup-stable-diffusion-forge-013XiFrER1WgZG4aDbDmEKjp
