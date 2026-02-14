# Bekir's Dotfiles

Personal configuration files for macOS, Fedora, and development environment.

## Quick Start
```bash
git clone git@github.com:bekir/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

- Shell configs (bash/zsh)
- Git configuration
- SSH config for work/home networks
- Custom scripts for GIS/FME workflows
- PostgreSQL client settings
- Python development tools

## OS-Specific Setup

### macOS
```bash
brew bundle --file=macos/Brewfile
```

### Fedora
```bash
sudo dnf install $(cat fedora/packages.txt)
```

## Organization

- `bin/` - Custom scripts (added to PATH)
- `shell/` - Shell configurations
- `git/` - Git settings
- `ssh/` - SSH client config
- OS-specific folders for package lists