# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#     ____  ____  ____  __  _______  ______
#    / __ \/ __ \/ __ \/  |/  / __ \/_  __/
#   / /_/ / /_/ / / / / /|_/ / /_/ / / /   
#  / ____/ _, _/ /_/ / /  / / ____/ / /    
# /_/   /_/ |_|\____/_/  /_/_/     /_/     

# GIT PROMPT setup
source /etc/bash_completion.d/git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\][\@][$?] \[\033[04;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;210m\]╭[\A][$?] \033[38;5;111m\]$(__git_ps1 " %s")\[\033[38;5;210m\]\n╰ \[\033[38;5;79m\]\w \033[38;5;229m\]➜ \[\033[00m\]'
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;210m\]╭[\@][$?]\[\033[38;5;79m\] \w \n\[\033[38;5;210m\]╰ '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[00;35m\]╭[$?] Adhyuth\n╰ \[\033[00;32m\]\w\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# LS_COLORS
LS_COLORS=$(cat $HOME/.ls_colors)
export LS_COLORS

### ROS
#export ROS_DOMAIN_ID=5
# source /opt/ros/humble/setup.bash
# alias microros="source /home/evoprime/PROJ/ROS/microros_ws/microros_ws/install/local_setup.bash && cd /home/evoprime/PROJ/ROS/microros_ws/microros_ws/"

# PATH
#pico-sdk
export PICO_SDK_PATH=/opt/pico-sdk/

# DEFAULTS
export VISUAL='nvim'
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

#alias tmux="tmux -u"
alias fixvol='alsactl restore -P'
#alias neofetch='neofetch --w3m /home/evoprime/Pictures/Wallpapers/The_Batman.png'
alias x='exit'
alias tkill='tmux kill-server'
alias c='clear'
alias shut='shutdown 0'
alias upkitty='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias bashrc='nvim ~/.bashrc'
alias polyconf='nvim ~/.config/polybar/config.ini'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias i3config='nvim ~/.config/i3/config'
alias piconf='nvim ~/.config/picom/picom.conf'
alias p3='python3'
alias kissh='kitty +kitten ssh'
alias graphics='sudo system76-power graphics'
alias power='sudo system76-power profile'
alias n='nvim'
alias sn='sudoedit'
alias mar='make && ./run'
alias o='xdg-open "$(fzf)"'
alias ninstall='sudo nala install'
alias nsearch='nala search'
alias nremove='sudo nala remove'
alias nupgrate='sudo nala update && sudo nala upgrade'
alias nlist='nala list'
alias fh='$(history | cut -c 8- | fzf)'
alias serve='python3 -m http.server && xdg-open http://0.0.0.0:8000/'

source $HOME/Athena/PROJ/evOS/configs.sh
EXPOS_DIR=~/PROJ/evOS
source $HOME/Athena/PROJ/pievOS/tools/configs.sh

alias dgpu='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias installsh='nvim ~/.dotfiles/install.sh'
# alias h='$(history | cut -c 8- | fzf)' #REPLACED WITH Atuin
alias scripts='cd ~/.config/scripts'
alias backupsh='cd $HOME/.dotfiles/ && ./backup.sh'
alias fixhot='nmcli r wifi off && rfkill unblock wlan'
alias nr='nvim -R'
alias code='code --profile=evoprime' #code behaving weird
alias rmr='rm -r'
alias rl='readlink'
alias rlf='readlink -f'
alias gnir='grep -niR'
alias sf='sudo env "YAZI_CONFIG_HOME=/home/evoprime/.config/yazi/" yazi'


# FUNCTIONS
function dojo() {
    cd $HOME/PROJ/$1/dojo/
}

function tess() {
    tesseract $1 /tmp/tesseract_out
    cat /tmp/tesseract_out.txt
}

function powsave() {
    sudo system76-power graphics intel
    sudo system76-power profile battery
    xrandr -r 60
}

function tess() {
    tesseract $1 /tmp/TESS
    cat /tmp/TESS.txt
}

function gccs(){
    gcc $1.c -o $1 
}

function listcol() {
    color=16;
    while [ $color -lt 245 ]; do
        echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
        ((color++));
    done  
}

function f() {	# wrapper for yazi - https://yazi-rs.github.io/docs/quick-start/
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

git-download(){
    folder=${@/tree\/master/trunk}
    folder=${folder/blob\/master/trunk}
    svn export $folder
}

#### ENVIRONMENTS
LANG=C.UTF-8
. "$HOME/.cargo/env"

# BASH Add-ons
# ble.sh
source /opt/ble.sh/out/ble.sh --rcfile "$HOME/.blerc"

#Android ANDROID_SDK
export ANDROID_HOME=/home/evoprime/Android/Sdk
export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/studio
# atuin
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"

#zoxide
eval "$(zoxide init bash)"

# complete-alias
source $HOME/.config/scripts/complete-alias-master/complete_alias

# nvm - npm installer :|
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
