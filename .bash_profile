
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash
PS1='\u@\h:\w \[\e[0;34m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

export PATH=/usr/local/bin:~/code/node_modules/.bin:$PATH

. ~/.nvm/nvm.sh

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
