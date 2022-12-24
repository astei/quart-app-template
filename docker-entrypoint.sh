#!/bin/sh

set -e

. /app/venv/bin/activate

# The recommended production setup for Uvicorn is to run it under gunicorn.
exec gunicorn piggybank:create_full_app --bind 0.0.0.0:8000 -w 4 -k uvicorn.workers.UvicornWorker