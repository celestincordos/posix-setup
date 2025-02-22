#!/bin/bash


# Source folder path
SOURCE_FOLDER="./dotfiles"

# Destination folder path
DESTINATION_FOLDER=$HOME

# Copy files from source folder to destination folder
cp -r dotfiles/.* "$DESTINATION_FOLDER"

# Print success message
echo "Dotfiles copied successfully!"
