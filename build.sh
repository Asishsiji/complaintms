#!/bin/bash
set -e  # Stop execution on error

# Create virtual environment using python3
python3 -m venv venv

# Activate virtual environment
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate  # Windows
else
    source venv/bin/activate  # Mac/Linux
fi

# Upgrade pip, setuptools, and wheel

# Install dependencies
python3 -m pip install -r requirements.txt


