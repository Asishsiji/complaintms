#!/bin/bash
set -e  # Stop execution on error

echo "Starting deployment..."

# Upgrade pip, setuptools, and wheel
python3 -m pip install --upgrade pip setuptools wheel

# Install dependencies
python3 -m pip install -r requirements.txt

# Apply migrations
echo "Running migrations..."
python manage.py migrate --noinput

# Collect static files
echo "Running collectstatic..."
python manage.py collectstatic --noinput
echo "Static files collected."

# Ensure media directory exists
mkdir -p public/media

# Start Gunicorn (using $PORT)
echo "Starting server..."
gunicorn --bind 0.0.0.0:$PORT web.wsgi:application
