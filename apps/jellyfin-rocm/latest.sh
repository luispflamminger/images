#!/bin/bash
VERSION=$(curl -s https://api.github.com/repos/jellyfin/jellyfin/releases/latest | jq --raw-output '.tag_name')
VERSION="${VERSION#*v}"
printf "%s" "${VERSION}"
