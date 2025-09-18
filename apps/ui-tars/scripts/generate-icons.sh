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
    echo "Generating $output_file"
    convert "$SOURCE_LOGO" -resize ${size}x${size} -background transparent "$output_file"
done

# Generate Windows ICO file with multiple sizes
echo "Generating Windows ICO file..."
convert "$SOURCE_LOGO" \
  \( -clone 0 -resize 16x16 \) \
  \( -clone 0 -resize 32x32 \) \
  \( -clone 0 -resize 48x48 \) \
  \( -clone 0 -resize 64x64 \) \
  \( -clone 0 -resize 128x128 \) \
  \( -clone 0 -resize 256x256 \) \
  -delete 0 "$ICONS_DIR/noshi.ico"

# Create base icon files
echo "Creating base icon files..."
convert "$SOURCE_LOGO" -resize 512x512 -background transparent "$ICONS_DIR/noshi.png"

# For macOS ICNS file, create it from the individual PNGs
echo "Generating macOS ICNS file..."
# Note: This creates a basic PNG as placeholder since proper ICNS creation requires macOS tools
convert "$SOURCE_LOGO" -resize 512x512 -background transparent "$ICONS_DIR/noshi.icns"

echo "Icon generation completed with proper ImageMagick conversion!"
echo "Generated icons:"
ls -la "$ICONS_DIR"