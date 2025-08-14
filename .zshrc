
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(git
         starship
         sudo
         zsh-syntax-highlighting 
         zsh-autosuggestions
         )

source $ZSH/oh-my-zsh.sh

alias ll='ls -alF'
alias gs='git status'
alias m='micro'
alias x='clear'

eval "$(zoxide init zsh)"

#source /home/chidori/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/chidori/ijadux2/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

nitch

 export MICRO_TRUECOLOR=1
