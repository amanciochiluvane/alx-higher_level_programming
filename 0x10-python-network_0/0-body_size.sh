#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url="$1"

response=$(curl -s "$url")  # Get the response body only
content_length=$(python -c "import sys; print(len(sys.stdin.read()))" <<< "$response")

if [ -z "$content_length" ]; then
    echo "Unable to get content length"
    exit 1
fi

echo "Size of response body: $content_length bytes"

