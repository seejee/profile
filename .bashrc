export PATH="/usr/local/bin:/usr/local/heroku/bin:$PATH"

alias tmux="TERM=screen-256color-bce tmux"

# git prompt
function prompt_callback {
  if [ `jobs | wc -l` -ne 0 ]; then
    echo -n " \e[33m\jz"
  fi
}

GIT_PROMPT_ONLY_IN_REPO=1
#source ~/.bash-git-prompt/gitprompt.sh

eval $(thefuck --alias)

if [ -f /usr/local/share/gitprompt.sh ]; then
  GIT_PROMPT_THEME=Default
  . /usr/local/share/gitprompt.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
