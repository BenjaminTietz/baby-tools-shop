#!/bin/sh

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Setting production mode..."
export DJANGO_PRODUCTION=True

echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

echo "Creating superuser..."
python manage.py createsuperuser --noinput || true

echo "Starting Django server..."
exec python manage.py runserver 0.0.0.0:8025


