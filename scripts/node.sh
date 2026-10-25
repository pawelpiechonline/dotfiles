#!/usr/bin/env bash
set -euo pipefail

if [ -s /usr/share/nvm/init-nvm.sh ]; then
  NVM_INIT=/usr/share/nvm/init-nvm.sh
elif command -v brew >/dev/null && [ -s "$(brew --prefix nvm)/nvm.sh" ]; then
  NVM_INIT="$(brew --prefix nvm)/nvm.sh"
else
  printf 'nvm is missing. Run scripts/bootstrap.sh first.\n' >&2
  exit 1
fi

# nvm does not support set -u.
set +u
# shellcheck source=/dev/null
. "$NVM_INIT"
nvm install --lts
nvm alias default 'lts/*'
set -u

node --version
npm --version
