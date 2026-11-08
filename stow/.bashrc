# nvm (installed via pacman).
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# uv tool binaries.
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac
export VPS_IP=164.132.46.220
export VPS_USER=debian

# Disable the scroll wheel of the mouse.
if [[ $- == *i* ]] && command -v mouse-scroll >/dev/null; then
  mouse-scroll start >/dev/null 2>&1
fi
