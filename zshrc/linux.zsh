# Linux-only zsh setup, sourced at the top of .zshrc (before compinit).
# Homebrew lives in ~/.linuxbrew (installed without sudo).

HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-$HOME/.linuxbrew}

# zsh is normally exec'd from bash (see setup.sh), which already ran
# `brew shellenv`; this covers zsh started any other way. fpath is zsh-only,
# so it is never inherited and always needs setting here.
typeset -U path fpath
path=($HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $path)
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
