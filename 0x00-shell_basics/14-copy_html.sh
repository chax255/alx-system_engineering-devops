#!/bin/bash

# Set the source directory and destination directory
source_dir=$(pwd)
destination_dir=$(dirname "$source_dir")

# Copy HTML files if they don't exist or are newer in the destination directory
for file in "$source_dir"/*.html; do
    filename=$(basename "$file")
    destination_path="$destination_dir/$filename"

    # Check if the file doesn't exist in the destination or is newer
    if [ ! -e "$destination_path" ] || [ "$file" -nt "$destination_path" ]; then
        cp "$file" "$destination_path"
        echo "Copied: $filename"
    else
        echo "Skipped: $filename (Already up-to-date)"
    fi
done

