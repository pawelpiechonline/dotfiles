#!/usr/bin/env bash
set -euo pipefail

EMAIL="317329313+pawelpiechonline@users.noreply.github.com"
PRIVATE_KEY="$HOME/.ssh/id_ed25519"
KNOWN_HOSTS="$HOME/.ssh/known_hosts"
GITHUB_HOST_KEY="github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ ! -f "$PRIVATE_KEY" ]; then
  printf '\n==> Generate an SSH key\n'
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$PRIVATE_KEY"
fi

# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints
touch "$KNOWN_HOSTS"
if ! grep -qxF "$GITHUB_HOST_KEY" "$KNOWN_HOSTS"; then
  printf '%s\n' "$GITHUB_HOST_KEY" >>"$KNOWN_HOSTS"
fi

printf '\nAdd the public key at https://github.com/settings/keys\n'
cat "$PRIVATE_KEY.pub"
