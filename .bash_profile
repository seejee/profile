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
alias rspec='rspec --color'
alias gti="git"
alias gut="git"
alias emacs="emacsclient -nw"
alias pylint="docker run --rm -v $(pwd):/app quay.io/lightside/flake8 /app $@"
alias dc="docker-compose"
alias lux="cd ~/code/lux"
alias vim='mvim -v'

prj() {
  cd "/Users/cgeihsler/code/lux/projects/$@"
}

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=200000
export RUBY_GC_HEAP_FREE_SLOTS=200000
export PGHOST=localhost
export PYTHONSTARTUP=~/.pystartup

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

. ~/.nvm/nvm.sh

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME="/Library/Java/Home"
export PATH="/usr/local/opt/qt/bin:$PATH"
