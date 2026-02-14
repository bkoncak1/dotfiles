#!/bin/bash

DOTFILES="$HOME/Developer/git/dotfiles"

echo "Installing dotfiles..."

# Ensure directories exist
mkdir -p ~/.ssh
mkdir -p ~/.local/bin
mkdir -p ~/Developer/bin

# Git
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
echo "✓ Git config"

# Shell
ln -sf "$DOTFILES/shell/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/shell/.zprofile" ~/.zprofile
ln -sf "$DOTFILES/shell/.p10k.zsh" ~/.p10k.zsh
echo "✓ Shell configs"

# SSH
if [ -f "$DOTFILES/ssh/config" ]; then
    ln -sf "$DOTFILES/ssh/config" ~/.ssh/config
    chmod 600 "$DOTFILES/ssh/config"
    echo "✓ SSH config"
fi

# Vim/Neovim
if [ -f "$DOTFILES/vim/.vimrc" ]; then
    ln -sf "$DOTFILES/vim/.vimrc" ~/.vimrc
    echo "✓ Vim config"
fi

# PostgreSQL
if [ -f "$DOTFILES/postgres/.psqlrc" ]; then
    ln -sf "$DOTFILES/postgres/.psqlrc" ~/.psqlrc
    echo "✓ PostgreSQL config"
fi

# Bin scripts to ~/Developer/bin (your preferred location)
for script in "$DOTFILES/bin"/*; do
    if [ -f "$script" ]; then
        ln -sf "$script" ~/Developer/bin/$(basename "$script")
        chmod +x "$script"
    fi
done
echo "✓ Bin scripts"

echo ""
echo "Done! Restart your terminal or run: source ~/.zshrc"