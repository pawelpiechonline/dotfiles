#!/usr/bin/env bash
# Entry point for the whole setup. Run this script, not the scripts it calls.
set -euo pipefail

# Resolve this directory so bootstrap works from any working directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
  Linux)
    if [ ! -f /etc/arch-release ]; then
      printf 'Only Arch Linux and macOS are supported.\n' >&2
      exit 1
    fi
    "$SCRIPT_DIR/arch.sh"
    ;;
  Darwin)
    "$SCRIPT_DIR/macos.sh"
    ;;
  *)
    printf 'Only Arch Linux and macOS are supported.\n' >&2
    exit 1
    ;;
esac

"$SCRIPT_DIR/stow.sh"
"$SCRIPT_DIR/ssh.sh"
"$SCRIPT_DIR/node.sh"
"$SCRIPT_DIR/python.sh"

printf '\nBootstrap complete. Restart your shell before using Node.js.\n'
