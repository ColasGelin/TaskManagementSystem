#!/bin/bash
set -e

echo "Waiting for database..."
python manage.py check --database default

echo "Creating migrations..."
python manage.py makemigrations users
python manage.py makemigrations

echo "Running migrations..."
python manage.py migrate --noinput

if [ "$DJANGO_DEBUG" != "True" ]; then
    echo "Collecting static files..."
    python manage.py collectstatic --noinput --clear
fi

echo "Starting application..."
exec "$@"