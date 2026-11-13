# macOS-only zsh setup, sourced at the top of .zshrc (before compinit).

HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/opt/homebrew}

# compinit refuses group/world-writable completion dirs
chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'
