#!/usr/bin/env bash

apt-get update
apt-get install --assume-yes python3-pip
pip3 install ansible

ansible --version

