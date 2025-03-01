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
alias lr='ll -R'
alias less='less -R'

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
export PAGER=less

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
alias update-tags="ctags -o $HOME/.tags -R /usr/include /usr/local/include"

# enable dark mode in QT apps
export QT_STYLE_OVERRIDE=Breeze

# shared libraries of projects
export ENABLE_VULKAN_RENDERDOC_CAPTURE=0
export RENDERDOC_HOOK_EGL=0

# add pico sdk to a separate path
export PICO_SDK_PATH=/usr/share/pico-sdk

# disable accidental writes
set -o noclobber

# add slang to PATH
export PATH=$PATH:$HOME/Slang/bin
