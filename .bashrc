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
    

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\][\@][$?] \[\033[04;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;35m\]╭[\@][$?]\n╰ \[\033[00;32m\]\w\$\[\033[00m\] '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[00;35m\]╭[\@][$?] Adhyuth\n╰ \[\033[00;32m\]\w\$\[\033[00m\] '
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


#   _______  ________________  __  ___
#  / ___/ / / / __/_  __/ __ \/  |/  /
# / /__/ /_/ /\ \  / / / /_/ / /|_/ / 
# \___/\____/___/ /_/  \____/_/  /_/            

### ROS
#export ROS_DOMAIN_ID=5
source /opt/ros/humble/setup.bash
alias microros="source /home/evoprime/PROJ/ROS/microros_ws/microros_ws/install/local_setup.bash && cd /home/evoprime/PROJ/ROS/microros_ws/microros_ws/"

# PATH

# DEFAULTS
export VISUAL='nvim'
export EDITOR="$VISUAL"
#alias tmux="tmux -u"
alias fixvol='alsactl restore -P'
#alias neofetch='neofetch --w3m /home/evoprime/Pictures/Wallpapers/The_Batman.png'
alias x='exit'
alias r3='ranger'
alias tkill='tmux kill-server'
alias c='clear'
alias shut='shutdown 0'
alias upkitty='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias bashrc='nvim ~/.bashrc'
alias polyconf='nvim ~/.config/polybar/config.ini'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias i3config='nvim ~/.config/i3/config'
alias piconf='nvim ~/.config/picom/picom.conf'
alias wl='/home/evoprime/PROJ/bash_Playground/logout.sh'
alias p3='python3'
alias ter='termusic ~/Music/'
alias musikcube='TERM=xterm-256color musikcube'
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
alias expos='cd ~/PROJ/eXpOS/myexpos'
alias dgpu='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias installsh='nvim ~/.dotfiles/install.sh'
alias h='$(history | cut -c 8- | fzf)'
alias scripts='cd ~/.config/scripts'
alias backupsh='~/.dotfiles/backup.sh'
alias m='musikcube'
#alias rosser='rosrun rosserial_python serial_node.py'
#### ENVIRONMENTS

LANG=C.UTF-8

# OTHER STUFF TO SOURCE
source /opt/ble.sh/out/ble.sh --rcfile "$HOME/.blerc"

