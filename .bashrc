export PATH="/usr/local/bin:/usr/local/heroku/bin:$PATH"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias tmux="TERM=screen-256color-bce tmux"

# git prompt
function prompt_callback {
  if [ `jobs | wc -l` -ne 0 ]; then
    echo -n " \e[33m\jz"
  fi
}

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh


# added by travis gem
[ -f /Users/seejee/.travis/travis.sh ] && source /Users/seejee/.travis/travis.sh
