#!/usr/bin/env bash
set -euo pipefail

PUBLIC_KEY="$HOME/.ssh/id_ed25519.pub"

if [ ! -f "$PUBLIC_KEY" ]; then
  printf 'No public key. Run scripts/ssh.sh first.\n' >&2
  exit 1
fi

cat "$PUBLIC_KEY"
