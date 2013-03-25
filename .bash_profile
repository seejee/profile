if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#shared bash history across sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export VIM_APP_DIR=/usr/local/Cellar/macvim/7.3-66/
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias tmux="TERM=screen-256color-bce tmux"
alias rspec='rspec --color'
alias roobee="ssh roobee -t /usr/local/bin/tmux a"
alias dw1="ssh prod-lms-ttm-dw-1.thinkthroughmath.com -t tmux a"
alias dw1_ssh="ssh -v -i ~/.ssh/ttm-prod-key.pem ubuntu@prod-lms-ttm-dw-1.thinkthroughmath.com"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash
PS1='\u@\h:\w \[\e[0;34m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=200000

set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
