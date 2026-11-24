#!/bin/bash

WORKSPACE="/workspace/09fc78fb-681f-4b38-9b1e-fa8b1ea82684"
BACKUPS_DIR="$WORKSPACE/backups"

mkdir -p "$BACKUPS_DIR"

STAMP=$(date '+%Y-%m-%d_%H-%M-%S')
ARCHIVE="$BACKUPS_DIR/backup_${STAMP}.tar.gz"

cd "$WORKSPACE" || exit 1
FILES=$(find . -maxdepth 1 -type f \( -name "*.sh" -o -name "*.log" \) -printf "%f\n")

if [ -z "$FILES" ]; then
    echo "No .sh or .log files found to backup."
    exit 0
fi

tar -czf "$ARCHIVE" $FILES

cd "$BACKUPS_DIR" || exit 1
mapfile -t LIST < <(ls -1t backup_*.tar.gz 2>/dev/null)
if [ "${#LIST[@]}" -gt 3 ]; then
    for ((i=3; i<${#LIST[@]}; i++)); do
        rm -f "${LIST[$i]}"
    done
fi

SIZE_BYTES=$(stat -c%s "$ARCHIVE" 2>/dev/null || wc -c < "$ARCHIVE")
TOTAL_COUNT=$(ls -1 backup_*.tar.gz 2>/dev/null | wc -l)

echo "Backup created: $ARCHIVE"
echo "Size: $SIZE_BYTES bytes"
echo "Total backups kept: $TOTAL_COUNT"
