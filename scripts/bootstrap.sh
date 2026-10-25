#!/usr/bin/env bash
set -euo pipefail

SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
  Linux)
    if [ ! -f /etc/arch-release ]; then
      printf 'Only Arch Linux and macOS are supported.\n' >&2
      exit 1
    fi
    "$SCRIPTS/arch.sh"
    ;;
  Darwin)
    "$SCRIPTS/macos.sh"
    ;;
  *)
    printf 'Only Arch Linux and macOS are supported.\n' >&2
    exit 1
    ;;
esac
"$SCRIPTS/stow.sh"
"$SCRIPTS/ssh.sh"
"$SCRIPTS/node.sh"
"$SCRIPTS/python.sh"

printf '\nBootstrap complete. Restart your shell before using Node.js.\n'
