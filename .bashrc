# ALIASES
alias v='vim'
alias rm='rm -i'
alias vim='vim'

# DEFAULT EDITOR
export EDITOR='/usr/local/bin/vim'

# IGNORE CTRL D
set -o ignoreeof

# BASH GIT PROMPT
GIT_PROMPT_ONLY_IN_REPO=0
source ~/Dotfiles/bash-git-prompt/gitprompt.sh

# RVM PATH
export PATH="$PATH:$HOME/.rvm/bin"

# ANDROID PATH
export PATH=${PATH}:~/Development/Cordova/Android/android-sdk-macosx/platform-tools:~/Development/Cordova/Android/android-sdk-macosx/tools

# NEOVIM
export PATH="${PATH}:/usr/local/Cellar/neovim/HEAD/bin/vim"

# hack to run vim-rspec with spring
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# hack to make sure that homebrew is
# consulted first when looking for bins
export PATH=/usr/local/bin:$PATH

# HEROKU TOOLBELT
export PATH="/usr/local/heroku/bin:$PATH"

# OPEN VIM WITH OBSESSION BY DEFAULT
# UNLESS A FILE ARGUMENT WAS PASSED
function vim() {
  if test $# -gt 0; then
    env vim "$@"
  elif test -f Session.vim; then
    env vim -S
  else
    env vim -c Obsession
  fi
}
