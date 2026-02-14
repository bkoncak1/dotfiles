# Bekir's Dotfiles

Personal configuration files for macOS, Fedora, and development environment.

## Quick Start

### macOS
```bash
git clone git@github.com:bkoncak1/dotfiles.git ~/Developer/git/dotfiles
cd ~/Developer/git/dotfiles
./macos/setup.sh
./install.sh
```

### Fedora
```bash
git clone git@github.com:bkoncak1/dotfiles.git ~/Developer/git/dotfiles
cd ~/Developer/git/dotfiles
./install.sh
```

**📖 For detailed setup instructions, see [SETUP.md](SETUP.md)**

---

## What's Included

- **Shell**: Zsh with Oh My Zsh and Powerlevel10k theme
- **Git**: Global configuration and ignore patterns
- **SSH**: Organized SSH client configurations
- **Scripts**: Custom automation tools for GIS/FME workflows
- **Development**: Python, PostgreSQL, and other dev tool configs
- **Packages**: Brewfile for macOS, package lists for Fedora

## Structure

```
dotfiles/
├── bin/          # Custom scripts (in PATH)
├── git/          # Git configuration
├── shell/        # Zsh configs and theme
├── ssh/          # SSH client config
├── macos/        # macOS-specific (Brewfile, setup)
└── fedora/       # Fedora-specific packages
```

## Updating

```bash
cd ~/Developer/git/dotfiles
git pull
./install.sh  # Re-run if needed
```

To update your Brewfile after installing new packages:
```bash
cd ~/Developer/git/dotfiles/macos
brew bundle dump --force
git add Brewfile && git commit -m "Update Brewfile" && git push
```

---

**Need help?** Check [SETUP.md](SETUP.md) for detailed instructions and troubleshooting.
