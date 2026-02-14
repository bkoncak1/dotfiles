# Dotfiles Setup Guide

Complete setup instructions for macOS and Fedora systems.

---

## macOS Setup

### 1. Prerequisites

First, install the base requirements:

```bash
# Clone the repository
git clone git@github.com:bkoncak1/dotfiles.git ~/Developer/git/dotfiles
cd ~/Developer/git/dotfiles

# Run macOS setup script
./macos/setup.sh
```

This installs:
- Homebrew
- Oh My Zsh
- Powerlevel10k theme
- zsh-autosuggestions plugin
- zsh-syntax-highlighting plugin

### 2. Install Dotfiles

```bash
# Run the main installation script
./install.sh
```

The script will:
- Create necessary directories
- Symlink all configuration files
- Ask if you want to install Homebrew packages

### 3. Manual Configuration (macOS)

**iTerm2:**
- Open iTerm2 → Preferences → Profiles → Text
- Change font to "MesloLGS NF" (installed by Powerlevel10k)
- Restart iTerm2

**Powerlevel10k:**
- If the configuration wizard doesn't start automatically, run:
  ```bash
  p10k configure
  ```

**Raycast:**
- Configure keyboard shortcuts
- Set up custom workflows and snippets

---

## Fedora Setup

### 1. Clone Repository

```bash
git clone git@github.com:bkoncak1/dotfiles.git ~/Developer/git/dotfiles
cd ~/Developer/git/dotfiles
```

### 2. Install Dotfiles

```bash
./install.sh
```

The script will:
- Create necessary directories
- Symlink all configuration files
- Ask if you want to install DNF packages

---

## What Gets Installed

### Configuration Files

All configs are symlinked from the dotfiles repo to your home directory:

| Source | Destination | Description |
|--------|-------------|-------------|
| `git/.gitconfig` | `~/.gitconfig` | Git configuration |
| `shell/.zshrc` | `~/.zshrc` | Zsh configuration |
| `shell/.zprofile` | `~/.zprofile` | Zsh profile |
| `shell/.p10k.zsh` | `~/.p10k.zsh` | Powerlevel10k theme config |
| `ssh/config` | `~/.ssh/config` | SSH client configuration |
| `vim/.vimrc` | `~/.vimrc` | Vim configuration |
| `postgres/.psqlrc` | `~/.psqlrc` | PostgreSQL client config |

### Custom Scripts

All scripts in `bin/` are symlinked to `~/Developer/bin` which is in your PATH.

---

## Updating Your Dotfiles

### Making Changes

Edit files directly in the dotfiles repository:

```bash
cd ~/Developer/git/dotfiles

# Edit a config file
vim shell/.zshrc

# Test the changes
source ~/.zshrc

# Commit and push
git add shell/.zshrc
git commit -m "shell: update PATH for new tool"
git push
```

### Pulling Updates on Another Machine

```bash
cd ~/Developer/git/dotfiles
git pull
./install.sh  # Re-run if new files were added
```

---

## Package Management

### macOS - Updating Brewfile

When you install new packages via Homebrew, update the Brewfile:

```bash
cd ~/Developer/git/dotfiles/macos
brew bundle dump --force
git add Brewfile
git commit -m "Update Brewfile with new packages"
git push
```

### macOS - Installing from Brewfile

On a new machine or to sync packages:

```bash
cd ~/Developer/git/dotfiles/macos
brew bundle install
```

### Fedora - Package Lists

Update `fedora/packages.txt` manually with packages you want to track.

---

## Troubleshooting

### Symlinks Not Working

If configs aren't being picked up:

```bash
# Check if symlinks exist
ls -la ~/.zshrc
ls -la ~/.gitconfig

# Manually create a symlink if needed
ln -sf ~/Developer/git/dotfiles/shell/.zshrc ~/.zshrc
```

### Oh My Zsh Conflicts

If Oh My Zsh overwrites your `.zshrc`:

```bash
# Re-run the install script
cd ~/Developer/git/dotfiles
./install.sh
```

### Missing Fonts (Powerlevel10k Icons)

Install MesloLGS NF fonts:

```bash
# macOS - fonts are installed automatically by p10k
# If needed, re-run:
p10k configure
```

### PATH Not Including ~/Developer/bin

Check your `.zshrc`:

```bash
grep "Developer/bin" ~/Developer/git/dotfiles/shell/.zshrc
```

Should include:
```bash
export PATH="$HOME/Developer/bin:$PATH"
```

---

## Fresh Machine Setup Checklist

### macOS
- [ ] Clone dotfiles repository
- [ ] Run `./macos/setup.sh`
- [ ] Run `./install.sh`
- [ ] Configure iTerm2 font (MesloLGS NF)
- [ ] Run `p10k configure` if needed
- [ ] Set up Raycast
- [ ] Generate SSH keys if needed
- [ ] Configure git user: `git config --global user.name "Your Name"`
- [ ] Configure git email: `git config --global user.email "your@email.com"`

### Fedora
- [ ] Clone dotfiles repository
- [ ] Run `./install.sh`
- [ ] Install Oh My Zsh manually if needed
- [ ] Install Powerlevel10k manually if needed
- [ ] Generate SSH keys if needed
- [ ] Configure git credentials

---

## Directory Structure

```
dotfiles/
├── README.md              # Quick overview
├── SETUP.md              # This file - detailed setup guide
├── install.sh            # Main installation script
├── .gitignore            # Git ignore rules
│
├── bin/                  # Custom executable scripts
│   └── (your scripts)
│
├── git/                  # Git configuration
│   ├── .gitconfig
│   └── .gitignore_global
│
├── shell/                # Shell configuration
│   ├── .zshrc
│   ├── .zprofile
│   └── .p10k.zsh
│
├── ssh/                  # SSH configuration
│   ├── config
│   └── README.md
│
├── vim/                  # Vim configuration
│   └── .vimrc
│
├── postgres/             # PostgreSQL configuration
│   └── .psqlrc
│
├── macos/                # macOS-specific
│   ├── setup.sh
│   ├── Brewfile
│   └── README.md
│
└── fedora/               # Fedora-specific
    ├── packages.txt
    └── README.md
```

---

## Tips

### Quick Aliases

Add these to your `.zshrc` for easier dotfiles management:

```bash
alias dots='cd ~/Developer/git/dotfiles'
alias dotfiles='cd ~/Developer/git/dotfiles'
alias dotvim='vim ~/Developer/git/dotfiles/shell/.zshrc'
alias dotcommit='cd ~/Developer/git/dotfiles && git add -A && git commit && git push'
```

### Check for Uncommitted Changes

Your `.zshrc` can warn you about uncommitted dotfiles changes:

```bash
# Already included in your dotfiles
# Shows warning on terminal startup if you have changes
```

### Backup Before Major Changes

```bash
# Create a backup branch before experimenting
cd ~/Developer/git/dotfiles
git checkout -b backup-$(date +%Y%m%d)
git checkout main
```
