#!/bin/bash


# Source folder path
SOURCE_FOLDER="./dotfiles"

# Destination folder path
DESTINATION_FOLDER=$HOME

# Copy files from source folder to destination folder
cp -r dotfiles/.* "$DESTINATION_FOLDER"

# Install personal commands
mkdir -p "$HOME/.local/bin"
if [ -d "$SOURCE_FOLDER/.local/bin" ]; then
    for command in "$SOURCE_FOLDER"/.local/bin/*; do
        [ -f "$command" ] || continue
        install -m 755 "$command" "$HOME/.local/bin/"
    done
fi

# Print success message
echo "Dotfiles copied successfully!"
