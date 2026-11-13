#!/usr/bin/env bash
# Set up this machine from ~/.config. Safe to re-run.
set -euo pipefail
cd "$(dirname "$0")"

brew bundle --file Brewfile

# Point $2 at $1, moving any existing file aside first
link() {
  local target=$1 dest=$2
  [[ $(readlink "$dest") == "$target" ]] && return
  if [[ -e $dest || -L $dest ]]; then
    mv "$dest" "$dest.pre-setup"
    echo "moved existing $dest to $dest.pre-setup"
  fi
  ln -s "$target" "$dest"
}
link "$PWD/zshrc/.zshrc" "$HOME/.zshrc"

if [[ $OSTYPE == linux* ]]; then
  # The login shell stays bash (chsh needs sudo here), so agents and scripts get
  # a plain bash. Interactive terminals (ssh, rex) switch to zsh at the end of
  # ~/.bashrc, after it has set up PATH. SHELL is left as bash on purpose: tools
  # launched from zsh (Claude Code, opencode) read it to pick their shell.
  marker='# >>> ~/.config/setup.sh: exec zsh >>>'
  if ! grep -qF "$marker" ~/.bashrc; then
    cat >>~/.bashrc <<'BASH'

# >>> ~/.config/setup.sh: exec zsh >>>
# Interactive terminals switch to zsh; agents (CLAUDECODE) and scripts stay in
# bash. Run `NO_ZSH=1 bash` for a plain bash.
if [[ $- == *i* && -t 0 && -t 1 && -z ${CLAUDECODE-} && -z ${NO_ZSH-} ]] &&
  command -v zsh >/dev/null; then
  exec zsh
fi
# <<< ~/.config/setup.sh: exec zsh <<<
BASH
    echo "added exec zsh to ~/.bashrc"
  fi
fi
