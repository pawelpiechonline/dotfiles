#!/usr/bin/env bash
set -euo pipefail

if ! command -v uv >/dev/null; then
  printf 'uv is missing. Run scripts/bootstrap.sh first.\n' >&2
  exit 1
fi

uv python install
uv python list --only-installed
