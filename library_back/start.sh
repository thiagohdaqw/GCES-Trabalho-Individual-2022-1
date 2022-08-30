#! /bin/bash

function wait_for_db() {
    while !</dev/tcp/$POSTGRES_HOST/$POSTGRES_PORT; do
        echo "Waiting database start... Retrying in 3 secs...";
        sleep 3;
    done; 
}

wait_for_db

python manage.py makemigrations
python manage.py migrate
python manage.py runserver 0.0.0.0:8000