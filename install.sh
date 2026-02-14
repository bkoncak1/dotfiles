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

# macOS prerequisites
if [[ "$OSTYPE" == "darwin"* ]] && [ -f "$DOTFILES/macos/setup.sh" ]; then
    echo ""
    read -p "Run macOS setup (Homebrew, Oh My Zsh, Powerlevel10k)? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "$DOTFILES/macos/setup.sh"
        echo "✓ macOS prerequisites installed"
    fi
fi

# Bin scripts to ~/Developer/bin
for script in "$DOTFILES/bin"/*; do
    if [ -f "$script" ]; then
        ln -sf "$script" ~/Developer/bin/$(basename "$script")
    fi
done
echo "✓ Bin scripts"

# macOS specific - Homebrew packages
if [[ "$OSTYPE" == "darwin"* ]] && [ -f "$DOTFILES/macos/Brewfile" ]; then
    echo ""
    read -p "Install Homebrew packages from Brewfile? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew bundle --file="$DOTFILES/macos/Brewfile"
        echo "✓ Homebrew packages installed"
    else
        echo "⊘ Skipped Homebrew packages"
    fi
fi

# Fedora specific - DNF packages
if [ -f /etc/fedora-release ] && [ -f "$DOTFILES/fedora/packages.txt" ]; then
    echo ""
    read -p "Install Fedora packages from packages.txt? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo dnf install -y $(cat "$DOTFILES/fedora/packages.txt")
        echo "✓ Fedora packages installed"
    else
        echo "⊘ Skipped Fedora packages"
    fi
fi

echo ""
echo "Done! Restart your terminal or run: source ~/.zshrc"