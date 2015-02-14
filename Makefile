#!/usr/bin/make
#
INSTALL_PATH = $(abspath .)
BIN_PATH=$(INSTALL_PATH)/bin
PYTHON=$(BIN_PATH)/python

all: install run

bin/python:
	virtualenv-2.7 .

install: bin/python
	#./bin/pip install -U cartridge
	tar xvzf setuptools-12.0.5.tar.gz
	cd setuptools-12.0.5; $(PYTHON) setup.py install
	tar xvzf Pillow-2.7.0.tar.gz
	cd Pillow-2.7.0; $(PYTHON) setup.py install
	$(PYTHON) manage.py createdb --noinput
	$(PYTHON) manage.py loaddata fixtures/data.json

dumpdata:
	$(PYTHON) manage.py dumpdata > fixtures/data.json

makemessages:
	$(PYTHON) manage.py makemessages -l fr
	$(PYTHON) manage.py compilemessages

run:
	$(PYTHON) manage.py runserver

cleanall:
	rm -rf bin include lib __pycache__ pip-selfcheck.json Database.sqlite3
