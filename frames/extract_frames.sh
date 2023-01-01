#!/bin/bash

# This script will extract all the frames from an .mp4 file and save them as .png files

# Check if ffmpeg is installed
if ! [ -x "$(command -v ffmpeg)" ]; then
  echo "Error: ffmpeg is not installed." >&2
  exit 1
fi

# Check if a file was specified
if [ -z "$1" ]; then
  echo "Error: No file specified." >&2
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File not found." >&2
  exit 1
fi

# Extract the frames
ffmpeg -i "$1" -vf "fps=1" "frame%03d.png"

echo "Done!"