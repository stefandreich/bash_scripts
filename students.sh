#!/usr/bin/env bash

while true; do
    if ! name=$(dialog --keep-tite --inputbox 'Please enter the name: ' 0 0 2>&1 >/dev/tty); then
        break
    fi

    if [[ -n "${name}" ]]; then
        echo "${name}" >> students.txt
    fi

    if ! dialog --keep-tite --yesno 'Do you want to continue?' 0 0; then
        break
    fi
done