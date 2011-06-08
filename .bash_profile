export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash
PS1='\u@\h:\w \[\e[0;34m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

##
# Your previous /Users/seejee/.bash_profile file was backed up as /Users/seejee/.bash_profile.macports-saved_2011-06-07_at_22:17:09
##

# MacPorts Installer addition on 2011-06-07_at_22:17:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

