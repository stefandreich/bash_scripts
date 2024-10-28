#!/usr/bin/env bash

declare -a folders
while getopts 'd:' opt; do
    case "${opt}" in
        d) 
            folders+=("${OPTARG}") ;;
            # echo "${opt} - ${OPTARG}" ;;
        *) ;;
    esac
done

if [[ "${#folders[@]}" -eq 0 ]]; then
    echo "No folders have been provided with -d" >&2
    exit 1
fi

threshold=10

for folder in "${folders[@]}"; do
    read -r size rest < <(du -sm "${folder}")
    if (( size >= threshold )); then
        echo "The size of the folder ${folder} is ${size}MB."
    fi
done