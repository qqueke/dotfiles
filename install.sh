```bash
#!/bin/bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES..."

# Home files
for file in "$DOTFILES/home/"* "$DOTFILES/home/".*; do
    [ -e "$file" ] || continue
    [ "$(basename "$file")" = "." ] && continue
    [ "$(basename "$file")" = ".." ] && continue

    target="$HOME/$(basename "$file")"

    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi

    ln -s "$file" "$target"
done

# ~/.config files
mkdir -p "$HOME/.config"

for dir in "$DOTFILES/config/"*; do
    [ -d "$dir" ] || continue

    name="$(basename "$dir")"
    target="$HOME/.config/$name"

    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
    fi

    ln -s "$dir" "$target"
done

echo "Dotfiles installed successfully."
```
