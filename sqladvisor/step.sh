#!/bin/bash
apt-get install python-pip libcurl4-openssl-dev libssl-dev  -y
pip install --upgrade pip
python -m pip install --upgrade --force pip
pip install setuptools==33.1.1
pip install pycurl
pip install -r requirements.txt
python manage.py db migrate
python manage.py db upgrade
python manage.py runserver --host 0.0.0.0:8077