export ZSH="/home/jokler/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/pkgfile/command-not-found.zsh

alias ls="/usr/bin/exa --git"
alias cat="/usr/bin/bat"
alias cp="/usr/bin/rsync --info=progress2 --no-inc-recursive"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
