#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
set -oue pipefail

# Backup /opt directory
mv /opt{,.bak}

# Create a new /opt directory
mkdir /opt

# Install Google Chrome
dnf install -y --enablerepo="google-chrome" google-chrome-stable

# Check if the Google Chrome directory exists before moving it
if [ -d "/opt/google/chrome" ]; then
    mv /opt/google/chrome /usr/lib/google-chrome
    ln -sf /usr/lib/google-chrome/google-chrome /usr/bin/google-chrome-stable

    # Create icon directories and link icons
    mkdir -p /usr/share/icons/hicolor/{16x16/apps,24x24/apps,32x32/apps,48x48/apps,64x64/apps,128x128/apps,256x256/apps}
    for i in "16" "24" "32" "48" "64" "128" "256"; do
        ln -sf /usr/lib/google-chrome/product_logo_$i.png /usr/share/icons/hicolor/${i}x${i}/apps/google-chrome.png
    done
fi

# Remove /etc/cron.daily directory
rm -rf /etc/cron.daily

# Remove /opt/google directory and restore the original /opt directory
rmdir /opt/{google,}
mv /opt{.bak,}

# Clean up DNF cache
dnf clean all