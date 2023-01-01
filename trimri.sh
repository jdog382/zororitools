#!/bin/bash

# Set the input folder and output folder
input_folder='./input'
output_folder='./output'

# Create the output folder if it doesn't exist
if [ ! -d "$output_folder" ]; then
  mkdir "$output_folder"
fi

# Find all the .mp4 files in the input folder
files=$(find "$input_folder" -name "*.mp4")

# Loop through each file
for file in $files
do
  # Get the filename without the path and extension
  filename=$(basename "$file" .mp4)
  
  # Trim 1 minute and 28 seconds off the start of the file using ffmpeg
  ffmpeg -ss 88 -i "$file" -c copy "$output_folder/$filename.mp4"
done