# ALIASES
alias rm='rm -i'
alias vim='vim'

# DEFAULT EDITOR
export EDITOR='/usr/local/bin/vim'

# IGNORE CTRL D
set -o ignoreeof

# SHELL SCRIPTS
GIT_PROMPT_ONLY_IN_REPO=0

# BASH GIT PROMPT
source ~/Dotfiles/bash-git-prompt/gitprompt.sh

# RVM PATH
export PATH="$PATH:$HOME/.rvm/bin"

# hack to run vim-rspec with spring
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# hack to make sure that homebrew is
# consulted first when looking for bins
export PATH=/usr/local/bin:$PATH

# HEROKU TOOLBELT
export PATH="/usr/local/heroku/bin:$PATH"

# OPEN VIM WITH OBSESSION BY DEFAULT
function vim() {
  if test $# -gt 0; then
    env vim "$@"
  elif test -f Session.vim; then
    env vim -S
  else
    env vim -c Obsession
  fi
}
