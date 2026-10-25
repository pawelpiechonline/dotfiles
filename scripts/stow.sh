#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

if ! command -v stow >/dev/null; then
  printf 'GNU Stow is missing. Run scripts/bootstrap.sh first.\n' >&2
  exit 1
fi

# A fresh Arch account has an unchanged copy of this skeleton file.
if cmp -s /etc/skel/.bashrc "$HOME/.bashrc" 2>/dev/null; then
  rm "$HOME/.bashrc"
fi

# Move every existing target that Stow would conflict with into a timestamped
# backup directory, so the repository always wins on a fresh run.
backup_conflicts() {
  local source rel target
  local made_backup=0

  while IFS= read -r -d '' source; do
    rel="${source#"$REPO/stow/"}"
    target="$HOME/$rel"

    if [ ! -e "$target" ] && [ ! -L "$target" ]; then
      continue
    fi

    if [ -L "$target" ] && [ "$(realpath "$target" 2>/dev/null)" = "$(realpath "$source")" ]; then
      continue
    fi

    mkdir -p "$BACKUP/$(dirname "$rel")"
    mv "$target" "$BACKUP/$rel"
    made_backup=1
  done < <(find "$REPO/stow" -type f -print0)

  if [ "$made_backup" -eq 1 ]; then
    printf 'Backed up replaced files to %s\n' "$BACKUP"
  fi
}

backup_conflicts

if ! stow --restow --no-folding --dir "$REPO" --target "$HOME" stow; then
  printf 'Stow reported a conflict. Move the listed files away, then run this script again.\n' >&2
  exit 1
fi
