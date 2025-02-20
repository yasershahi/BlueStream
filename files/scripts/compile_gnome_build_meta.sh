#!/bin/bash
set -oue pipefail

# Set variables
GNOME_BUILD_META_REPO="https://gitlab.gnome.org/GNOME/gnome-build-meta.git"
GNOME_BUILD_META_DIR="gnome-build-meta"

# Install BuildStream
source bst-venv/bin/activate

# Clone the repository
if [ ! -d "$GNOME_BUILD_META_DIR" ]; then
    git clone $GNOME_BUILD_META_REPO
fi

cd $GNOME_BUILD_META_DIR

# Fetch the latest changes
git pull

# Build the GNOME build meta project
bst build gnome/world

# Deactivate the virtual environment
deactivate

# Clean up
cd ..
rm -rf $GNOME_BUILD_META_DIR