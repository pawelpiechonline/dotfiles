#!/usr/bin/env bash
set -euo pipefail

if [ -s /usr/share/nvm/init-nvm.sh ]; then
  NVM_INIT=/usr/share/nvm/init-nvm.sh
else
  NVM_INIT="$(brew --prefix nvm)/nvm.sh"
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
