export ZSH="/home/jokler/.oh-my-zsh"
export RUSTFLAGS="-C link-arg=-fuse-ld=lld"
export RUST_BACKTRACE=0

eval "$(starship init zsh)"

plugins=(git cargo rust ripgrep wd)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/scripts/zplug/init.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source /home/jokler/.config/broot/launcher/bash/br

zplug 'wfxr/forgit'
zplug 'Tarrasch/zsh-bd'
zplug load

alias rm="/usr/bin/rm -I"
alias mv="/usr/bin/mv -i"

alias ls="/usr/bin/exa --git"
alias cp="/usr/bin/rsync -pog -hhh --info=progress2 --no-inc-recursive"

alias cal="/usr/bin/cal -m"

alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias hfzf="fc -El 0 | fzf --tac"
alias unexport="unset"

alias zshrc="${=EDITOR} ~/.zshrc"
alias i3config="${=EDITOR} ~/.config/i3/config"
alias polyconfig="${=EDITOR} ~/.config/polybar/config"

# some function from the archwiki that shows imformation about kernel modules
function show_mod_parameter_info ()
{
  if tty -s <&1
  then
    green="\e[1;32m"
    yellow="\e[1;33m"
    cyan="\e[1;36m"
    reset="\e[0m"
  else
    green=
    yellow=
    cyan=
    reset=
  fi
  newline="
"

  while read mod
  do
    md=/sys/module/$mod/parameters
    [[ ! -d $md ]] && continue
    d="$(modinfo -d $mod 2>/dev/null | tr "\n" "\t")"
    echo -en "$green$mod$reset"
    [[ ${#d} -gt 0 ]] && echo -n " - $d"
    echo
    pnames=()
    pdescs=()
    pvals=()
    pdesc=
    add_desc=false
    while IFS="$newline" read p
    do
      if [[ $p =~ ^[[:space:]] ]]
      then
        pdesc+="$newline    $p"
      else
        $add_desc && pdescs+=("$pdesc")
        pname="${p%%:*}"
        pnames+=("$pname")
        pdesc=("    ${p#*:}")
        pvals+=("$(cat $md/$pname 2>/dev/null)")
      fi
      add_desc=true
    done < <(modinfo -p $mod 2>/dev/null)
    $add_desc && pdescs+=("$pdesc")
    for ((i=0; i<${#pnames[@]}; i++))
    do
      printf "  $cyan%s$reset = $yellow%s$reset\n%s\n" \
        ${pnames[i]} \
        "${pvals[i]}" \
        "${pdescs[i]}"
    done
    echo

  done < <(cut -d' ' -f1 /proc/modules | sort)
}

# tty solarized
if [ "$TERM" = "linux" ]; then
    echo -en "\e]PB657b83" # S_base00
    echo -en "\e]PA586e75" # S_base01
    echo -en "\e]P0073642" # S_base02
    echo -en "\e]P62aa198" # S_cyan
    echo -en "\e]P8002b36" # S_base03
    echo -en "\e]P2859900" # S_green
    echo -en "\e]P5d33682" # S_magenta
    echo -en "\e]P1dc322f" # S_red
    echo -en "\e]PC839496" # S_base0
    echo -en "\e]PE93a1a1" # S_base1
    echo -en "\e]P9cb4b16" # S_orange
    echo -en "\e]P7eee8d5" # S_base2
    echo -en "\e]P4268bd2" # S_blue
    echo -en "\e]P3b58900" # S_yellow
    echo -en "\e]PFfdf6e3" # S_base3
    echo -en "\e]PD6c71c4" # S_violet
    clear # against bg artifacts
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  #exec startx
fi
