MODEL_DIR="$(pwd)/models"
mkdir -p "$MODEL_DIR"

URL="https://huggingface.co/unsloth/gemma-4-E2B-it-GGUF/resolve/main/gemma-4-E2B-it-Q4_K_M.gguf"
FILE_NAME="gemma-4-E2B-it-Q4_K_M.gguf"

MMPROJ_URL="https://huggingface.co/unsloth/gemma-4-E2B-it-GGUF/resolve/main/mmproj-F16.gguf"
MMPROJ_FILE_NAME="mmproj-F16.gguf"

HF_HUB_ENABLE_HF_TRANSFER=1 hf download unsloth/gemma-4-E2B-it-GGUF gemma-4-E2B-it-Q4_K_M.gguf --local-dir "$MODEL_DIR"
HF_HUB_ENABLE_HF_TRANSFER=1 hf download unsloth/gemma-4-E2B-it-GGUF mmproj-F16.gguf --local-dir "$MODEL_DIR"

echo "Download script finished."