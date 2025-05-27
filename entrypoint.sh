#!/bin/sh

echo "Waiting for PostgreSQL..."

while ! nc -z $DB_HOST $DB_PORT; do
  sleep 0.5
done

echo "PostgreSQL started"

python manage.py migrate --noinput
python manage.py collectstatic --noinput
gunicorn djcrm.wsgi:application --bind 0.0.0.0:8080
