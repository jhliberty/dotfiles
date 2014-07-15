# ALIASES
alias rm='rm -i'

# DEFAULT EDITOR
export EDITOR='/usr/local/Cellar/vim/7.3.923/bin/vim'

# IGNORE CTRL D
set -o ignoreeof

# SHELL SCRIPTS
GIT_PROMPT_ONLY_IN_REPO=0

source ~/Dotfiles/bash-git-prompt/gitprompt.sh

# RVM PATH
export PATH="$PATH:$HOME/.rvm/bin"

# hack to run vim-rspec with spring
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# hack to make sure that homebrew is
# consulted first when looking for bins
export PATH=/usr/local/bin:$PATH
