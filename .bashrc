# ALIASES
alias rm='rm -i'
alias vimm='/usr/local/Cellar/vim/7.4.273/bin/vim'
alias vim='/usr/local/Cellar/vim/7.4.273/bin/vim'
alias vi='/usr/local/Cellar/vim/7.4.273/bin/vim'

# DEFAULT EDITOR
export EDITOR='/usr/local/Cellar/vim/7.4.273/bin/vim'

# IGNORE CTRL D
set -o ignoreeof

# SHELL SCRIPTS
GIT_PROMPT_ONLY_IN_REPO=0

source ~/Dotfiles/bash-git-prompt/gitprompt.sh
source ~/Dotfiles/tmux_send_to_all.sh

# RVM PATH
export PATH="$PATH:$HOME/.rvm/bin"

# hack to run vim-rspec with spring
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
