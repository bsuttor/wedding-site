#!/usr/bin/make
#
INSTALL_PATH = $(abspath .)
BIN_PATH=$(INSTALL_PATH)/bin
PYTHON=$(BIN_PATH)/python

all: install run

bin/python:
	virtualenv-3.4 .

install: bin/python
	./bin/pip install -U cartridge
	./bin/pip install django-mathfilters
	$(PYTHON) manage.py createdb --noinput
	#$(PYTHON) manage.py loaddata backup.json
	$(PYTHON) manage.py loaddata fixtures/data.json

dumpdata:
	$(PYTHON) manage.py dumpdata > fixtures/data.json

makemessages:
	$(PYTHON) manage.py makemessages -l fr
	$(PYTHON) manage.py compilemessages

run:
	$(PYTHON) manage.py runserver 0.0.0.0:8000

cleanall:
	rm -rf bin include lib __pycache__ pip-selfcheck.json Database.db
