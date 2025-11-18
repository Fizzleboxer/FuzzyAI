# Uncensored Model Configuration

This configuration file (`config.json`) is set up for running the gpt-oss:20b model in an uncensored mode for offline use.

## Configuration Details

### Model Setup
- **Model**: `ollama/gpt-oss:20b`
- **Provider**: Ollama (for offline/local inference)

### Uncensored Settings

1. **No System Prompt**: The system prompt is set to empty (`system_prompt=`), removing any built-in behavioral constraints or guidelines that might filter responses.

2. **No Classifiers**: The classifier array is empty, meaning no content moderation or safety filters will be applied to inputs or outputs.

3. **Optimized Generation Parameters**:
   - `temperature=1.0`: Full creativity and randomness for diverse responses
   - `top_p=0.95`: High nucleus sampling for varied token selection
   - `top_k=50`: Increased sampling pool for more response options
   - `num_ctx=4096`: Large context window for better conversation memory

### Usage

To use this configuration with FuzzyAI:

```bash
# Using the config file
fuzzyai --config config.json

# Or specify parameters directly
fuzzyai --model ollama/gpt-oss:20b --attack-modes def -e system_prompt= -e temperature=1.0 -e top_p=0.95 -e top_k=50 -e num_ctx=4096
```

### Prerequisites

1. **Ollama installed** and running locally
2. **gpt-oss:20b model pulled** in Ollama:
   ```bash
   ollama pull gpt-oss:20b
   ```

### Notes

- This configuration is designed for offline use when internet connectivity is unavailable
- No safety filters or content moderation are applied
- Responses are completely uncensored based on the model's training
- Use responsibly and in accordance with applicable laws and regulations
