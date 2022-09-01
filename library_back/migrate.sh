#! /bin/bash

while !</dev/tcp/$POSTGRES_HOST/$POSTGRES_PORT; do
    echo "Waiting database start... Retrying in 3 secs...";
    sleep 3;
done; 

python manage.py makemigrations
python manage.py migrate