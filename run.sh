#!/bin/bash

# Configuration
HOST="0.0.0.0"
PORT="8080"
N_CTX="32768"
THREADS="4"
MODEL_ALIAS="Gemma-2B"
MODEL_PATH="/models/gemma-4-E2B-it-Q4_K_M.gguf"
MMPROJ_PATH="/models/mmproj-F16.gguf"

# Build the llama-server arguments
SERVER_ARGS=(
    "--host" "$HOST"
    "--port" "$PORT"
    "-c" "$N_CTX"
    "-m" "$MODEL_PATH"
    "-a" "$MODEL_ALIAS"
    "--mmproj" "$MMPROJ_PATH"
    "--threads" "$THREADS"
    "--cache-type-k" "q4_0"
    "--cache-type-v" "q4_0"
)


echo "Starting llama.cpp server container..."

# Stop and remove existing container if it's already running
docker rm -f llama-cpp-server 2>/dev/null

# Run the docker container
docker run -d \
    --name llama-cpp-server \
    --restart always \
    -p "${PORT}:${PORT}" \
    -v "$(pwd)/models:/models" \
    ghcr.io/ggml-org/llama.cpp:server \
    "${SERVER_ARGS[@]}"

echo "Server is running in the background."
echo "You can view the logs using: docker logs -f llama-cpp-server"
