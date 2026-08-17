#!/bin/bash

set -e

echo "=== Post-install configuration starting ==="

# Change default shell to zsh
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "→ Changing default shell to Zsh..."
    chsh -s /bin/zsh
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "→ Installing Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Post-install setup complete...✔"
