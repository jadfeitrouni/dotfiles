setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit

source <(fzf --zsh)
source <(kubectl completion zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Emacs keymap, set explicitly (otherwise zsh picks vi when $EDITOR contains "vi")
bindkey -e

# Ctrl+G: edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^g' edit-command-line

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# Up/Down: walk history; with text typed, only entries containing that text
# (Ctrl+K/J are taken by herdr pane navigation)
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship config
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ls='eza -la --icons=auto $eza_params'
alias lt="eza --tree --level=2 --long --icons --git"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'

export EDITOR=nvim

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

export XDG_CONFIG_HOME="$HOME/.config"
