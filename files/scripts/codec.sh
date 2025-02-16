#!/usr/bin/env bash
set -oue pipefail

(rpm-ostree override remove \
    ffmpeg-free \
    libavcodec-free \
    libavdevice-free \
    libavfilter-free \
    libavformat-free \
    libavutil-free \
    libpostproc-free \
    libswresample-free \
    libswscale-free \
    --install=ffmpeg \
    --install=gstreamer1-plugin-libav \
    --install=gstreamer1-plugins-bad-free-extras \
    --install=gstreamer1-plugins-bad-freeworld \
    --install=gstreamer1-plugins-ugly \
    --install=gstreamer1-vaapi) || true