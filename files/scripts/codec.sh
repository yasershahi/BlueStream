#!/usr/bin/env bash
set -oue pipefail

rpm-ostree override remove \
    fdk-aac-free \
    ffmpeg-free \
    libavcodec-free \
    libavdevice-free \
    libavfilter-free \
    libavformat-free \
    libavutil-free \
    libpostproc-free \
    libswresample-free \
    libswscale-free \
    noopenh264


rpm-ostree override replace \
  --experimental \
  --from repo='fedora-multimedia' \
    libheif \
    libva \
    libva-intel-media-driver \
    mesa-dri-drivers \
    mesa-filesystem \
    mesa-libEGL \
    mesa-libGL \
    mesa-libgbm \
    mesa-libglapi \
    mesa-libxatracker \
    mesa-va-drivers \
    mesa-vulkan-drivers \
    ffmpeg \
    ffmpeg-libs \
    gstreamer1-plugin-libav \
    gstreamer1-plugins-bad \
    gstreamer1-plugins-ugly \
    gstreamer1-plugin-vaapi \
    openh264 \
    mozilla-openh264 \
    x264 \
    x265