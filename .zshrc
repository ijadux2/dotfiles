
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git
          starship)

source $ZSH/oh-my-zsh.sh

alias m='micro'
alias ls='lsd'
alias cd='z'
alias x='clear'


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
