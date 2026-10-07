```bash
#!/bin/bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES..."

# Copy home dotfiles
cp -r "$DOTFILES/home/." "$HOME/"

# Copy ~/.config
mkdir -p "$HOME/.config"
cp -r "$DOTFILES/config/." "$HOME/.config/"

echo "Dotfiles installed successfully."
``````
