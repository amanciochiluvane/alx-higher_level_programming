#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url="$1"

response=$(curl -sI "$url")  # Get headers only
content_length=$(echo "$response" | grep -i Content-Length | awk '{print $2}')

if [ -z "$content_length" ]; then
    echo "Unable to get content length"
    exit 1
fi

echo "Size of response body: $content_length bytes"


