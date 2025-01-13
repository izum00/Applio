#!/bin/sh

# Set terminal title
printf "\033]0;Applio\007"

# Navigate to the correct directory
cd "$(dirname "$0")" || exit 1

# Activate the virtual environment
if [ -f .venv/bin/activate ]; then
    . .venv/bin/activate
else
    echo "Error: Virtual environment not found at .venv/bin/activate"
    exit 1
fi

# Set PyTorch environment variables
export PYTORCH_ENABLE_MPS_FALLBACK=1
export PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0

# Clear the terminal
clear

# Run the application
if [ -f app.py ]; then
    python app.py --open
else
    echo "Error: app.py not found in $(pwd)"
    exit 1
fi
