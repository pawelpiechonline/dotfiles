# nvm (installed via pacman).
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# uv tool binaries.
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac
