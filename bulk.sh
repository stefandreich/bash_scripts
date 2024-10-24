#!/usr/bin/env bash

declare api_url
declare counter

counter=1
not_found=0

while true; do
    api_url="https://downloads.codingcoursestv.eu/055%20-%20bash/while/images/image-${counter}.jpg"
    echo "Downloading: ${api_url}"
    if curl "${api_url}" -o image-"${counter}.jpg" --silent --fail; then
        not_found=0
    else
        (( not_found = not_found + 1))
        if (( not_found >= 10 )); then
            break
        fi
    fi
    (( counter = counter + 1))
done