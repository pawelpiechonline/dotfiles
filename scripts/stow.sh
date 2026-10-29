#!/usr/bin/env bash
set -euo pipefail

# Resolve paths from this script so it works from any working directory.
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# A fresh Arch account has an unchanged copy of this skeleton file.
if cmp -s /etc/skel/.bashrc "$HOME/.bashrc" 2>/dev/null; then
  rm "$HOME/.bashrc"
fi

# Back up anything that would prevent Stow from linking a repository file.
backup_conflicts() {
  local source_file relative_path target_file backup_file

  # NUL-delimited paths keep spaces in filenames intact.
  while IFS= read -r -d '' source_file; do
    relative_path="${source_file#"$REPO_DIR/stow/"}"
    target_file="$HOME/$relative_path"

    if [ ! -e "$target_file" ] && [ ! -L "$target_file" ]; then
      continue
    fi

    if [ -L "$target_file" ] && [ "$target_file" -ef "$source_file" ]; then
      continue
    fi

    backup_file="$BACKUP_DIR/$relative_path"
    mkdir -p "$(dirname "$backup_file")"
    mv "$target_file" "$backup_file"
    printf 'Backed up %s to %s\n' "$target_file" "$backup_file"
  done < <(find "$REPO_DIR/stow" -type f -print0)
}

backup_conflicts

# Link files individually instead of linking whole directories.
stow --restow --no-folding --dir "$REPO_DIR" --target "$HOME" stow
