
[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER=news.epita.fr

export EDITOR=vim

alias g++="g++ -Wall -Wextra -Werror -std=c++17"

alias mk="make -B"
alias mc="make clean"
alias ls='ls --color=auto'
export PS1="\[\033[38;5;6m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;12m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;190m\]\A\[$(tput sgr0)\]$ "
