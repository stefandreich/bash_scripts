#!/usr/bin/env bash

if [[ -f 'romeo.txt' ]]; then
    echo 'File already exists'
else
    echo 'Downloading file...'
    if curl https://downloads.codingcoursestv.eu/055%20-%20bash/if/romeo.txt -o romeo.txt --silent; then
        echo 'Download completed successfully'
    else
        echo 'Download failed' >&2
        exit 1
    fi
fi

word_count="$(grep -c 'love' romeo.txt)"
echo "The word 'love' is found in ${word_count} lines."
