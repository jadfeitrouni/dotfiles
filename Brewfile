# Installed by ./setup.sh on macOS and Linux.

brew "eza"
brew "fd"
brew "fzf"
brew "hunk"
brew "lazygit"
brew "neovim"
brew "ripgrep"
brew "starship"
brew "zsh-autosuggestions"
brew "zsh-completions"
brew "zsh-history-substring-search"
brew "zsh-syntax-highlighting"

if OS.mac?
  # The Linux box installs these its own way (node@24, cargo, opencode's installer)
  brew "node"
  brew "worktrunk"
  brew "anomalyco/tap/opencode"
  cask "ghostty"
  cask "nikitabobko/tap/aerospace"
else
  # macOS ships zsh; on Linux the system one needs sudo
  brew "zsh"
end
