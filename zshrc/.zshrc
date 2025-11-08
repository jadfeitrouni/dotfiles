setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit

source <(kubectl completion zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
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

# VI Mode
bindkey '\e' vi-cmd-mode

# Aliases
alias ls='eza -la --icons $eza_params'
alias lt="eza --tree --level=2 --long --icons --git"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# K8S
alias kube-prod="aws eks update-kubeconfig --region ca-central-1 --name TT-PROD-CLUSTER"
alias kube-util="aws eks update-kubeconfig --region ca-central-1 --name TT-UTILITY-CLUSTER"

chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'


# oh-my-zsh

# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="agnoster"
# ZSH_CUSTOM=~/.config/omz
# plugins=(
#     git
# )
# source $ZSH/oh-my-zsh.sh

# config
# prompt_context(){}
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

export XDG_CONFIG_HOME="$HOME/.config"
