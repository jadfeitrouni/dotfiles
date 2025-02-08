# lazygit
export XDG_CONFIG_HOME="$HOME/.config"
# ZSH plugins

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

chmod go-w '/opt/homebrew/share'
chmod -R go-w '/opt/homebrew/share/zsh'

source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# oh-my-zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
ZSH_CUSTOM=~/.config/omz
plugins=(
    git
)
source $ZSH/oh-my-zsh.sh

# config
prompt_context(){}
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

