#!/bin/bash
set -e

echo "Waiting for database..."
python manage.py check --database default

echo "Running migrations..."
python manage.py migrate --noinput

# Only collect static files if not in debug mode
if [ "$DJANGO_DEBUG" != "True" ]; then
    echo "Collecting static files..."
    python manage.py collectstatic --noinput --clear
fi

echo "Starting Django development server..."
python manage.py runserver 0.0.0.0:8000