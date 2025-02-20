#!/usr/bin/env bash
set -oue pipefail

(rpm-ostree override remove \
    mesa-va-drivers \
    --install=mesa-va-drivers-freeworld \
    --install=mesa-vdpau-drivers-freeworld) || true

case "$(rpm -E %{_arch})" in
    x86_64)
        rpm-ostree install steam-devices
        rpm-ostree install intel-media-driver libva-intel-driver
        ;;
esac