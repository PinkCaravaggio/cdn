#!/bin/bash

# Run from the script's folder
cd ..
cd "$(dirname "$0")"

BASE_URL="https://letongchen.art/cdn/images"
IMAGE_DIR="."

# Add all changes
git add -A

# Commit with automatic timestamp
commitMsg="Auto update $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commitMsg"

# Push to remote
git push

# Output image URLs
echo
echo "✅ Uploaded images and URLs:"
echo "-------------------------------"

shopt -s nullglob
for file in "$IMAGE_DIR"/*.{jpg,jpeg,png,gif,webp,svg,bmp}; do
    filename=$(basename "$file")
    echo "$BASE_URL/$filename"
done

echo "-------------------------------"
echo "Done!"
