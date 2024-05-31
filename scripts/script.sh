#!/bin/bash

# Install dependencies
pip install --no-cache-dir -r requirements.txt

# Run test
python test.py
pytest test.py --cov --cov-report xml:coverage/test-reporter.xml

# Coverage percentages
coverage=$(grep -oP 'Statements.*?(\d+(?:\.\d+)?)%' coverage/test-reporter.xml | grep -oP '\d+(?:\.\d+)?')

if [[ -z "$coverage" ]]; then
  echo "No se encontró 'Statements' en coverage/test-reporter.xml"
else
  echo "Cobertura encontrada: $coverage%"
fi
