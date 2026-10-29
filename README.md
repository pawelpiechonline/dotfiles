# Dotfiles

Setup for Arch Linux and macOS. GNU Stow links files from stow into home.

## Install

    git clone --depth 1 https://github.com/pawelpiechonline/dotfiles.git ~/dotfiles && ~/dotfiles/scripts/bootstrap.sh

The script picks your OS, installs packages, links dotfiles, makes an SSH key,
and installs Node.js and Python.

Then log out and log in. Restart the shell. On macOS open Docker Desktop.
Add the printed SSH key at https://github.com/settings/keys as an auth key and a
signing key.

## Notes

Files that Stow would overwrite are moved to ~/.dotfiles-backup/<timestamp>.
Never put private keys or tokens in stow.

