#!/usr/bin/env bash
set -euo pipefail

uv python install
uv python list --only-installed
