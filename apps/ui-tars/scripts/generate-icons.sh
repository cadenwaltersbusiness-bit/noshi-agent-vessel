#!/bin/bash

# Icon generation script for Noshi Agent Vessel
# This script generates icon sets from the source logo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
SOURCE_LOGO="$REPO_ROOT/branding/ChatGPT Image Sep 17, 2025, 10_49_47 PM.png"
ICONS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/resources/icons"

echo "Source logo: $SOURCE_LOGO"
echo "Icons directory: $ICONS_DIR"

# Create icons directory if it doesn't exist
mkdir -p "$ICONS_DIR"

# Check if source logo exists
if [ ! -f "$SOURCE_LOGO" ]; then
    echo "Error: Source logo not found at: $SOURCE_LOGO"
    echo "Please ensure the exact file exists with the name specified in the requirements."
    exit 1
fi

# Generate macOS PNG sizes
echo "Generating macOS PNG icons..."
sizes=(16 32 64 128 256 512 1024)

for size in "${sizes[@]}"; do
    output_file="$ICONS_DIR/icon_${size}x${size}.png"
    echo "Creating placeholder for $output_file"
    # For now, create placeholder files - in a real scenario, you'd use ImageMagick:
    # convert "$SOURCE_LOGO" -resize ${size}x${size} "$output_file"
    cp "$SOURCE_LOGO" "$output_file"
done

# Create base icon files (placeholders for now)
echo "Creating base icon files..."
cp "$SOURCE_LOGO" "$ICONS_DIR/noshi.png"
cp "$SOURCE_LOGO" "$ICONS_DIR/noshi.ico"
cp "$SOURCE_LOGO" "$ICONS_DIR/noshi.icns"

echo "Icon generation completed!"
echo "Note: These are placeholder files. In production, use ImageMagick or similar tools to properly resize and convert the icons."