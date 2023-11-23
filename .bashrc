# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ignore duplicate entries
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# convenience aliases
alias cls='clear'
alias ls='ls -B --color=auto'
alias lh='ls -d .[!.]* 2> /dev/null'
alias lb='ls -d *~ .[!.]*~ 2> /dev/null'
alias ll='ls -lh'
alias ld='ls -ld'
alias lr='ll -R'

# safety aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
alias vi='vim'
alias view='vi -M'

# colorful grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# prepare the environment
export EDITOR=vim
export VISUAL=view
export PAGER=most

if [ $USER == "root" ]; then
    export PS1="[\[\033[1;31m\]\u \[\033[1;33m\]{\j} \[\033[1;36m\]\W\[\033[1;00m\]]\$ "
else
    export PS1="[\[\033[1;32m\]\u \[\033[1;33m\]{\j} \[\033[1;36m\]\W\[\033[1;00m\]]\$ "
fi

# fix git's gpg signing problem
export GPG_TTY=$(tty)

# enable multi-threaded compilation
alias make='make -j4'

# update tags file
alias update-tags="ctags -o $HOME/.tags -R /usr/include /usr/local/include $HOME/Desktop"

# enable dark mode in QT apps
export QT_STYLE_OVERRIDE=Breeze

# use ncurses for vlc in terminal
alias vlc='vlc -I ncurses'

# shared libraries of projects
export LD_LIBRARY_PATH=~/Desktop/Poe/lib
export ENABLE_VULKAN_RENDERDOC_CAPTURE=0
export RENDERDOC_HOOK_EGL=0
