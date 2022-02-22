# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ignore duplicate entries
export HISTCONTROL=ignoreboth:erasedups

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
export EDITOR=vi
export VISUAL=vi
export TERM=xterm-256color
export PAGER=most
export PS1="[\[\033[1;32m\]\u \[\033[1;33m\]{\j} \[\033[1;36m\]\W\[\033[1;00m\]]\$ "

# fix git's gpg signing problem
export GPG_TTY=$(tty)

# set vi key-bindings
set -o vi

# enable multi-threaded compilation
alias make='make -j4'
