#!/bin/bash
set -oue pipefail

# Set variables
GSETTINGS_REPO="https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas.git"
GSETTINGS_DIR="gsettings-desktop-schemas"
GSETTINGS_VERSION="48.beta"

# Install build dependencies
dnf install -y git meson ninja-build glib2-devel gobject-introspection-devel

# Clone the repository
if [ ! -d "$GSETTINGS_DIR" ]; then
    git clone $GSETTINGS_REPO
fi

cd $GSETTINGS_DIR

# Fetch the latest changes
git fetch --all

# Checkout the specific version
git checkout $GSETTINGS_VERSION

# Build and install
meson setup builddir --prefix=/usr
ninja -C builddir
ninja -C builddir install

# Clean up build dependencies
dnf remove --setopt=clean_requirements_on_remove=1 -y git meson ninja-build glib2-devel gobject-introspection-devel

# Clean up
cd ..
rm -rf $GSETTINGS_DIR