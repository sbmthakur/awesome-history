#!/bin/bash
# Fetch the actual display name of a YouTube channel from its handle
# Usage: ./fetch-youtube-name.sh <youtube-handle>
# Example: ./fetch-youtube-name.sh @SirManateee

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <youtube-handle>"
    echo "Example: $0 @SirManateee"
    exit 1
fi

HANDLE="$1"
URL="https://www.youtube.com/${HANDLE}"

echo "Fetching channel name from: ${URL}"
NAME=$(curl -s "${URL}" | grep -oP '"name":"[^"]*"' | head -1 | sed 's/"name":"//;s/"$//' | sed 's/ - YouTube$//')

if [ -z "$NAME" ]; then
    echo "Error: Could not extract channel name"
    exit 1
fi

echo "${NAME}"
