#!/bin/bash

pip install --no-cache-dir -r requirements.txt
python test.py
pytest test.py --cov --cov-report xml:coverage/test-reporter.xml
