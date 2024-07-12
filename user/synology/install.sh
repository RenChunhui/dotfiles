#!/bin/sh

for f in ~/Library/Application Support/SynologyDrive/data/session/*/conf/blacklist.filter; do ln -sf ${PWD}/etc/snyology/blacklist.filter $f; done
