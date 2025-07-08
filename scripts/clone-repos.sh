#!/bin/bash

set -e

echo "📦 Cloning repositories..."

# Clone neovim config
if [ ! -d "$HOME/.config/nvim" ]; then
	echo "→ Cloning Neovim config"
	git clone git@github.com:mzoubek/nvim-config.git ~/.config/nvim
fi

# Install packer.nvim if not installed
PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIR" ]; then
	echo "→ Installing packer.nvim"
	git clone git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
fi

echo "✅ All repositories cloned and Neovim is ready!"
