#!/bin/bash
set -oue pipefail

# Set variables
MUTTER_REPO="https://gitlab.gnome.org/GNOME/mutter.git"
MUTTER_DIR="mutter"

# Install build dependencies
dnf builddep -y mutter

# Clone the repository
if [ ! -d "$MUTTER_DIR" ]; then
    git clone $MUTTER_REPO
fi

cd $MUTTER_DIR

# Fetch the latest changes
git pull

# Build and install
meson builddir --prefix=/usr
ninja -C builddir
ninja -C builddir install

# Clean up build dependencies
dnf remove --setopt=clean_requirements_on_remove=1 -y $(dnf repoquery --installonly --latest-limit=1 --qf '%{NAME}')

# Clean up
cd ..
rm -rf $MUTTER_DIR