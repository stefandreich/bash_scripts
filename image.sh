#!/usr/bin/env bash

for filename in image-*; do
    if [[ "${filename}" == *.thumbnail.* ]]; then
        continue
    fi
    echo "${filename}"
    
    no_extension="${filename%.*}"

    thumbnail_filename="${no_extension}.thumbnail.jpg"
    if [[ -f "${thumbnail_filename}" ]]; then
        continue
    fi

    width=$(identify -format '%w' "${filename}")
    height=$(identify -format '%h' "${filename}")

    if (( width > 100 || height > 100 )); then
        convert "${filename}" -resize 100x100 "${thumbnail_filename}"
    fi
done