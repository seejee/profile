export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash
PS1='\u@\h:\w \[\e[0;34m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

export PATH=/opt/local/bin:/opt/local/sbin:~/code/node_modules/.bin:$PATH

. ~/.nvm/nvm.sh
