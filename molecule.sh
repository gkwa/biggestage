#!/usr/bin/env bash

set -e

sudo apt-get install -y python3-pip libssl-dev
pip3 install ansible-dev-tools
python3 -m pip install molecule ansible-core
python3 -m pip install --upgrade --user setuptools
python3 -m pip install --user molecule
python3 -m pip install --user molecule ansible-lint
python3 -m pip install --user "molecule-plugins[podman]"
apt-get -y install podman
