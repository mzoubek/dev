#!/bin/bash

set -e

echo "⚙️ Post-install configuration starting..."

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

# Set GTK theme (WhiteSur) / Icon theme
echo "→ Applying GTK and icon themes..."

GTK_CONFIG_DIR="$HOME/.config/gtk-3.0"
mkdir -p "$GTK_CONFIG_DIR"

cat > "$GTK_CONFIG_DIR/settings.ini" <<EOF
[Settings]
gtk-theme-name=WhiteSur-dark
gtk-icon-theme-name=WhiteSur-dark
gtk-font-name=JetBrainsMono Nerd Font 10
EOF

echo "→ Updated ~/.config/gtk-3.0/settings.ini"

echo "✅ Post-install setup complete!"
