export ZSH="/home/jokler/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export BROWSER='firefox'
export PATH="$PATH:$HOME/scripts:/usr/games"

# Launcher for clipmenu
export CM_LAUNCHER=rofi
export QT_STYLE_OVERRIDE=gtk2

alias ls="/usr/bin/exa --git"
alias cat="/usr/bin/bat"
alias cp="/usr/bin/rsync --info=progress2 --no-inc-recursive"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
