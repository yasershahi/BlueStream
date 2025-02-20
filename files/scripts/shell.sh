#!/bin/bash
set -oue pipefail

# Set variables
SHELL_REPO="https://gitlab.gnome.org/GNOME/gnome-shell.git"
SHELL_DIR="gnome-shell"

# Install build dependencies
dnf builddep -y gnome-shell

# Clone the repository
if [ ! -d "$SHELL_DIR" ]; then
    git clone $SHELL_REPO
fi

cd $SHELL_DIR

# Fetch the latest changes
git pull

# Build and install
meson setup builddir --prefix=/usr
ninja -C builddir
ninja -C builddir install

# Clean up build dependencies
dnf remove --setopt=clean_requirements_on_remove=1 -y $(dnf repoquery --installonly --latest-limit=1 --qf '%{NAME}')

# Clean up
cd ..
rm -rf $SHELL_DIR