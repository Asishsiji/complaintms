#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

# Create virtual environment
python -m venv venv

# Activate virtual environment
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate  # Windows
else
    source venv/bin/activate  # Mac/Linux
fi

# Upgrade pip, setuptools, and wheel
python -m pip install --upgrade pip setuptools wheel

# Install dependencies
python -m pip install -r requirements.txt

