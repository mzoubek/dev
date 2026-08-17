#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dev/dotfiles/"
TARGET_DIR="$HOME/.config/"

echo "=== Creating symlinks ==="

echo $TARGET_DIR
for dir in "$DOTFILES_DIR"*/; do # List directories
    dir=${dir%*/}                # Remove the trailing "/"
    actual_dir=${dir##*/}
    echo "$TARGET_DIR$actual_dir"
    ln -s "$dir" "$TARGET_DIR$actual_dir"

    echo "✓ Symlinked $actual_dir"
done

echo "=== Enabling Bluetooth service ==="
sudo systemctl enable bluetooth.service

echo "All symlinks created...✔"
