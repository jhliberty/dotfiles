# ALIASES
alias v='vim'
alias rm='rm -i'
alias vim='vim'

# BASH GIT PROMPT
GIT_PROMPT_ONLY_IN_REPO=0
source ~/Dotfiles/bash-git-prompt/gitprompt.sh

# hack to run vim-rspec with spring
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# hack to make sure that homebrew is
# consulted first when looking for bins
export PATH=/usr/local/bin:$PATH
