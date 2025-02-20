#!/bin/bash
set -oue pipefail

# Install dependencies for BuildStream
dnf install -y git python3-pip python3-venv

# Create a virtual environment for BuildStream
python3 -m venv bst-venv

# Activate the virtual environment
source bst-venv/bin/activate

# Install BuildStream
pip install buildstream

# Deactivate the virtual environment
deactivate