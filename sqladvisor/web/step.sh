#!/bin/bash
apt-get install python-pip libcurl4-openssl-dev libssl-dev  gunicorn -y
pip install --upgrade pip
python -m pip install --upgrade --force pip
pip install setuptools==33.1.1
pip install pycurl
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
python manage.py db init
python manage.py db migrate
python manage.py db upgrade
python manage.py runserver --host 0.0.0.0
gunicorn manage:app -p manage.pid -b 0.0.0.0:8000 -D
