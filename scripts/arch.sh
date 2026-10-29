#!/usr/bin/env bash
set -euo pipefail

PACMAN_PACKAGES=(
  base-devel
  git
  curl
  stow
  openssh
  tmux
  fd
  ripgrep
  kitty
  xdg-terminal-exec
  vim
  neovim
  firefox
  bitwarden
  zed
  ttf-jetbrains-mono
  uv
  nvm
  docker
  docker-compose
)
AUR_PACKAGES=(
  pi
  vscodium-bin
)

if [ "$(id -u)" -eq 0 ]; then
  printf 'Run this script as a regular user with sudo access.\n' >&2
  exit 1
fi

printf '\n==> Update Arch and install repository packages\n'
sudo pacman -Syu --needed "${PACMAN_PACKAGES[@]}"

if ! command -v paru >/dev/null 2>&1; then
  printf '\n==> Build paru from the AUR\n'
  BUILD_DIR="$(mktemp -d)"
  trap 'rm -rf "$BUILD_DIR"' EXIT
  git clone --depth 1 https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
  (cd "$BUILD_DIR/paru" && makepkg -si)
fi

printf '\n==> Install AUR packages\n'
paru -S --needed "${AUR_PACKAGES[@]}"

printf '\n==> Enable Docker\n'
sudo systemctl enable --now docker.service

USER_NAME="$(id -un)"
if ! id -nG "$USER_NAME" | grep -qw docker; then
  sudo usermod -aG docker "$USER_NAME"
  printf 'Log out and back in to use Docker without sudo.\n'
fi

if [ "${SHELL:-}" != /usr/bin/bash ]; then
  printf '\n==> Set Bash as the default shell\n'
  chsh -s /usr/bin/bash
fi

printf '\n==> Refresh the font cache\n'
fc-cache -f >/dev/null
