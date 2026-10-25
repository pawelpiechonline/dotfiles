#!/usr/bin/env bash
set -euo pipefail

EMAIL="317329313+pawelpiechonline@users.noreply.github.com"
PRIVATE_KEY="$HOME/.ssh/id_ed25519"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ ! -f "$PRIVATE_KEY" ]; then
  printf '\n==> Generate an SSH key\n'
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$PRIVATE_KEY"
fi

printf '\nAdd the public key at https://github.com/settings/keys\n'
cat "$PRIVATE_KEY.pub"
