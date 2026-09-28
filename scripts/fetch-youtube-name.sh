#!/bin/bash
# Fetch the actual display name of a YouTube channel from its URL or handle
# Usage: ./fetch-youtube-name.sh <youtube-url-or-handle>
# Examples:
#   ./fetch-youtube-name.sh https://www.youtube.com/@SirManateee
#   ./fetch-youtube-name.sh @SirManateee

set -uo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <youtube-url-or-handle>"
    echo "Examples:"
    echo "  $0 https://www.youtube.com/@SirManateee"
    echo "  $0 @SirManateee"
    exit 1
fi

INPUT="$1"

# Extract handle from URL if needed
if [[ "$INPUT" =~ ^https?://www\.youtube\.com/ ]]; then
    HANDLE="${INPUT#*//}"
    URL="$INPUT"
else
    HANDLE="$INPUT"
    URL="https://www.youtube.com/${HANDLE}"
fi

echo "Fetching channel name from: ${URL}"
NAME=$(curl -s "${URL}" | grep -oP '"name":"[^"]*"' | head -1 | sed 's/"name":"//;s/"$//' | sed 's/ - YouTube$//')

if [ -z "$NAME" ]; then
    echo "Error: Could not extract channel name"
    exit 1
fi

echo "${NAME}"
