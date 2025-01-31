# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
ZSH_CUSTOM=~/.config/omz
plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# config
prompt_context(){}
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

