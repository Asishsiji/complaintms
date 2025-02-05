#!/bin/bash
python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools==58.2.0 wheel
python3 -m pip install -r requirements.txt
