#!/bin/bash

# Source folder path
source_folder="./files"

# Destination folder path
destination_folder=$HOME

# Copy files from source folder to destination folder
cp -r "$source_folder" "$destination_folder"

# Print success message
echo "Files copied successfully!"