#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$REPO/stow/.config/VSCodium/User"
TARGET="$HOME/Library/Application Support/VSCodium/User"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
FILES=(settings.json keybindings.json)

if [ "$(uname -s)" != Darwin ]; then
  printf 'This script only links VSCodium on macOS. Linux uses Stow.\n' >&2
  exit 1
fi

for file in "${FILES[@]}"; do
  source_file="$SOURCE/$file"
  target_file="$TARGET/$file"

  if [ ! -f "$source_file" ]; then
    printf 'Missing %s.\n' "$source_file" >&2
    exit 1
  fi

  if [ -L "$target_file" ] && [ "$(realpath "$target_file" 2>/dev/null)" = "$(realpath "$source_file")" ]; then
    printf 'Already linked %s\n' "$target_file"
    continue
  fi

  if [ -e "$target_file" ] || [ -L "$target_file" ]; then
    backup_file="$BACKUP/Library/Application Support/VSCodium/User/$file"
    mkdir -p "$(dirname "$backup_file")"
    mv "$target_file" "$backup_file"
    printf 'Backed up %s to %s\n' "$target_file" "$backup_file"
  fi

  mkdir -p "$TARGET"
  ln -s "$source_file" "$target_file"
  printf 'Linked %s to %s\n' "$target_file" "$source_file"
done
