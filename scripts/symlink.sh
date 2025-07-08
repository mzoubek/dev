#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dev/dotfiles"
TARGET_DIR="$HOME"

echo "Creating symlink..."

# Top-level dotfiles
for file in "$DOTFILES_DIR"/.*; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")

    # Skip unwanted files
    [[ "$filename" == "." || "$filename" == ".." || "$filename" == ".git" ]] && continue

    ln -sf "$file" "$TARGET_DIR/$filename"
    echo "✓ Symlinked $filename"
done

# Nested dotfiles
if [ -d "$DOTFILES_DIR/.config" ]; then
	find "$DOTFILES_DIR/.config" -type f ! -path "*/.git/*" ! -path "*/nvim/*" | while read -r src; do
        rel_path="${src#$DOTFILES_DIR/}"
        dest="$TARGET_DIR/$rel_path"

        mkdir -p "$(dirname "$dest")"
        ln -sf "$src" "$dest"
        echo "✓ Symlinked $rel_path"
    done
fi

echo "✅ All symlinks created!"
