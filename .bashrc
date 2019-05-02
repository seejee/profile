export PATH="/usr/local/bin:/usr/local/heroku/bin:$PATH"

alias tmux="TERM=screen-256color-bce tmux"

# git prompt
function prompt_callback {
  if [ `jobs | wc -l` -ne 0 ]; then
    echo -n " \e[33m\jz"
  fi
}

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.git-completion.bash

eval $(thefuck --alias)

if [ -f /usr/local/share/gitprompt.sh ]; then
  GIT_PROMPT_THEME=Default
  . /usr/local/share/gitprompt.sh
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source <(kubectl completion bash)
