# ALIAS

alias vi='/usr/local/Cellar/vim/7.3.923/bin/vim'
alias vim='/usr/local/Cellar/vim/7.3.923/bin/vim'

alias mysql='/usr/local/mysql/bin/mysql'
alias mysqldump='/usr/local/mysql/bin/mysqldump'
alias mongo='mongod run --config /usr/local/etc/mongod.conf'
alias elastic='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.20.5/config/elasticsearch.yml'
alias git='/usr/local/Cellar/git/2.0.0/bin/git'

# EDITOR
export EDITOR='/usr/local/Cellar/vim/7.3.923/bin/vim'

# RVM
[[ -s "/Users/vasconcelloslf/.rvm/scripts/rvm" ]] && source "/Users/vasconcelloslf/.rvm/scripts/rvm"

# GIT PROMPT
GIT_PROMPT_ONLY_IN_REPO=0
source ~/.bash-git-prompt/gitprompt.sh

# ANDROID
export PATH=${PATH}:/Users/vasconcelloslf/Development/Android/android-sdk/sdk/platform-tools:/Users/vasconcelloslf/Development/Android/android-sdk/sdk/tools
export JAVA_HOME=$(/usr/libexec/java_home)

# PHONEGAP ANT
export ANT_HOME="/Users/vasconcelloslf/Development/Android/android-sdk/eclipse/plugins/org.apache.ant_1.8.4.v201303080030"
export PATH=$PATH:$ANT_HOME/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
