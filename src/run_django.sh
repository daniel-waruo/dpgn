#!/bin/sh
project_name="webservice"

if [ ! -d $project_name ]; then
    django-admin startproject $project_name
fi

cd $project_name
python manage.py makemigrations && python manage.py migrate && gunicorn $project_name.wsgi -b 0.0.0.0:8000