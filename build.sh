#!/bin/bash
set -e  # Stop execution on error

# Create virtual environment using python3 (Good)
python3 -m venv venv

# Activate virtual environment (Good)
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate  # Windows
else
    source venv/bin/activate  # Mac/Linux
fi

# Upgrade pip, setuptools, and wheel (Good)
python3 -m pip install --upgrade pip setuptools wheel

# Install dependencies (Good)
python3 -m pip install -r requirements.txt

# Migrate database (If needed)
python manage.py migrate

# Collect static files (CRUCIAL)
echo "About to run collectstatic..." # Debug output
python manage.py collectstatic --noinput
echo "collectstatic completed."

# Create public/media directory if you use media files (If needed)
if [ ! -d "public/media" ]; then
  mkdir -p public/media
  echo "public/media directory created"
fi

# ***YOUR SERVER START COMMAND (VERY IMPORTANT - THE MISSING PIECE)***
echo "Starting server..."  # Debug output
gunicorn --bind :8080 web.wsgi:application  # Or your specific command
# OR (for development only - NOT RECOMMENDED FOR PRODUCTION)
# python manage.py runserver 0.0.0.0:8080"

# Check if the public/static directory exists (Debugging)
if [ -d "public/static" ]; then
  echo "public/static directory exists."
  ls public/static  # List files inside public/static
else
  echo "public/static directory DOES NOT exist!"
fi

# Create public/media directory if you use media files (If needed)
if [ ! -d "public/media" ]; then
  mkdir -p public/media
  echo "public/media directory created"
fi

# Your server start command (VERY IMPORTANT)
echo "Starting server..." # Add this
gunicorn --bind :8080 web.wsgi:application  # Or your specific command
# OR
pip install python-dotenv
pip install dj-database-url

# python manage.py runserver 0.0.0.0:8080 # For development only (not recommended for production)
