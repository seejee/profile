if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export EDITOR="/usr/local/bin/mvim -v"
set -o vi

#shared bash history across sessions
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export LANG=en_US.UTF-8

alias tmux="TERM=screen-256color-bce tmux"
alias gti="git"
alias gut="git"
alias emacs="emacsclient -nw"
alias vim='mvim -v'

prj() {
  cd "/Users/cgeihsler/code/lux/projects/$@"
}

export PGHOST=localhost
export PYTHONSTARTUP=~/.pystartup

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# jump directly to a color env through the devdeployer
color() {
    if [ -z "$1" ]
    then
     echo "Please specify the name of the color!"
    else
     ssh -t -X devdeployer scripts/ssh_farmhouse.sh $1
    fi
}
