#!/usr/bin/env bash
set -euo pipefail

# Resolve paths from this script so it works from any working directory.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VSCODIUM_SOURCE="$REPO_DIR/stow/.config/VSCodium/User"
VSCODIUM_TARGET="$HOME/Library/Application Support/VSCodium/User"
VSCODIUM_FILES=(settings.json keybindings.json)
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

FORMULAE=(
  git
  curl
  stow
  openssh
  tmux
  fd
  ripgrep
  vim
  neovim
  uv
  nvm
  pi-coding-agent
  docker
  docker-compose
)
CASKS=(
  kitty
  firefox
  bitwarden
  docker-desktop
  font-jetbrains-mono
)

if [ "$(id -u)" -eq 0 ]; then
  printf 'Run this script as a regular user.\n' >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  printf '\n==> Install Homebrew\n'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# A fresh Homebrew installation is not on PATH yet.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

printf '\n==> Update Homebrew and install formulae\n'
brew update
brew install "${FORMULAE[@]}"

printf '\n==> Install applications\n'
brew install --cask "${CASKS[@]}"

# macOS keeps VSCodium settings in Library, not in Stow's .config directory.
printf '\n==> Link VSCodium settings\n'
mkdir -p "$VSCODIUM_TARGET"
for file in "${VSCODIUM_FILES[@]}"; do
  source_file="$VSCODIUM_SOURCE/$file"
  target_file="$VSCODIUM_TARGET/$file"

  if [ ! -f "$source_file" ]; then
    printf 'Missing %s.\n' "$source_file" >&2
    exit 1
  fi

  if [ -L "$target_file" ] && [ "$target_file" -ef "$source_file" ]; then
    printf 'Already linked %s\n' "$target_file"
    continue
  fi

  if [ -e "$target_file" ] || [ -L "$target_file" ]; then
    backup_file="$BACKUP_DIR/Library/Application Support/VSCodium/User/$file"
    mkdir -p "$(dirname "$backup_file")"
    mv "$target_file" "$backup_file"
    printf 'Backed up %s to %s\n' "$target_file" "$backup_file"
  fi

  ln -s "$source_file" "$target_file"
  printf 'Linked %s to %s\n' "$target_file" "$source_file"
done

printf '\nOpen Docker Desktop to start the Docker daemon.\n'
