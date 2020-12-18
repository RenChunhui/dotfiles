#!/bin/sh

sudo easy_install pip
pip3 install --upgrade pip

sudo rm /usr/local/bin/python*
sudo rm /usr/local/bin/pip*
sudo rm -Rf /Library/Frameworks/Python.framework/Versions/*

pip install python-language-server
