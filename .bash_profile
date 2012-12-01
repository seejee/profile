if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias rspec='rspec --color'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash
PS1='\u@\h:\w \[\e[0;34m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

alias roobee="ssh roobee -t /usr/local/bin/tmux a"

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=200000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
