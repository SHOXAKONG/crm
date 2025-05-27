#!/bin/bash

# Apply migrations
echo "Running migrations..."
python manage.py migrate

# Start Gunicorn
exec "$@"
