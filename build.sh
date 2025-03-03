#!/bin/bash
set -e  # Stop execution on error

echo "Starting deployment..."

# Upgrade pip, setuptools, and wheel
python3 -m pip install --upgrade pip setuptools wheel

# Install dependencies
python3 -m pip install -r requirements.txt

# Apply migrations
echo "Running migrations..."
python3 manage.py migrate --noinput

# Collect static files
echo "Running collectstatic..."
python3 manage.py collectstatic --noinput
echo "Static files collected."

# Ensure media directory exists
mkdir -p public/media

# Set default PORT if not provided
PORT=${PORT:-8080}

# Start Gunicorn with the correct port
echo "Starting server on port $PORT..."
python3 -m gunicorn --bind 0.0.0.0:$PORT web.wsgi:application
