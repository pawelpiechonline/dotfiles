#!/usr/bin/env bash
set -euo pipefail

SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

if ! command -v brew >/dev/null; then
  printf '\n==> Install Homebrew\n'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif ! command -v brew >/dev/null; then
  printf 'Homebrew was installed, but brew is not available.\n' >&2
  exit 1
fi

printf '\n==> Update Homebrew and install formulae\n'
brew update
brew install "${FORMULAE[@]}"

printf '\n==> Install applications\n'
brew install --cask "${CASKS[@]}"

printf '\n==> Link VSCodium settings\n'
"$SCRIPTS/vscodium.sh"

printf '\nOpen Docker Desktop to start the Docker daemon.\n'
