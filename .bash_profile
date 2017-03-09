if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export EDITOR=/usr/local/bin/vim
set -o vi

#shared bash history across sessions
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export VIM_APP_DIR=/usr/local/Cellar/macvim/7.3-66/
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export LANG=en_US.UTF-8

alias tmux="TERM=screen-256color-bce tmux"
alias rspec='rspec --color'
alias roobee="ssh roobee -t /usr/local/bin/tmux a"
alias gti="git"
alias emacs="emacsclient -nw"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000
export PGHOST=localhost

export PATH="$PATH:/usr/local/Cellar/postgresql/9.3.1/bin:$HOME/.rvm/bin:~/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

. ~/.nvm/nvm.sh
