#!/bin/bash

set -e

echo "🔧 Installing Pacman packages..."
xargs -a "$(dirname "$0")/../packages/pacman.txt" sudo pacman -S --noconfirm --needed

# Install paru
if ! command -v paru &>/dev/null; then
	echo "📦 Installing paru AUR helper..."
	mkdir -p "$HOME/build"
	cd "$HOME/build"
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si --noconfirm

	echo "✅ paru installed!"
fi

echo "🔧 Installing AUR packages with paru..."
xargs -a "$(dirname "$0")/../packages/aur.txt" paru -S --noconfirm --needed --skipreview

echo "✅ All packages installed!"
