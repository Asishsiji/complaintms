#!/bin/bash
python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install -r requirements.txt
