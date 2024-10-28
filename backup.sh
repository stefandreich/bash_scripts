#!/usr/bin/env bash

log_error() {
    echo "$1" >&2
    echo "$1" >>backup.log
}

exit_code=0
date_str=$(date '+%m-%d')

folders=(
    "./customers_data"
    "./inventory_data"
)
for folder in "${folders[@]}"; do
    folder_basename=$(basename "${folder}")
    archive_path="backups/${folder_basename//_/-}-${date_str}.tar.bz2"

    if ! tar -cjf "${archive_path}" "${folder}"; then
        log_error "[ERROR]: Tar of ${folder} could not be created"
        exit_code=1
    fi
done

if ! ./backup_db.sh > "backups/orders-${date_str}.sql"; then
    log_error "[ERROR]: Creating the BD backup failed"
    exit_code=2
elif ! bzip2 "backups/orders-${date_str}.sql"; then
    log_error "[ERROR]: Compressing of the DB backup failed"
    exit_code=3
fi

exit ${exit_code}
