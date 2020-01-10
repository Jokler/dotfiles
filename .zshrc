export ZSH="/home/jokler/.oh-my-zsh"
ZSH_THEME="blinks"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/pkgfile/command-not-found.zsh

alias rm="/usr/bin/rm -I"
alias mv="/usr/bin/mv -i"

alias ls="/usr/bin/exa --git"
alias cp="/usr/bin/rsync -pog -hhh --info=progress2 --no-inc-recursive"

alias cal="/usr/bin/cal -m"

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias hfzf="fc -El 0 | fzf --tac"
alias unexport="unset"

alias zshrc="${=EDITOR} ~/.zshrc"
alias i3config="${=EDITOR} ~/.config/i3/config"
alias polyconfig="${=EDITOR} ~/.config/polybar/config"
