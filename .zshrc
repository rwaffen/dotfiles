# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/puppetlabs/bin:$PATH"
export PATH="/opt/puppetlabs/pdk/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# shell basics
alias ll='eza --long --header --binary --git --icons=auto'
alias find="gfind"
alias sed="gsed"

alias k=kubectl
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# git aliases
alias glean="git branch --merged | egrep -v '(^\*|master|main|production)' | xargs git branch -D"
alias glean_all="git for-each-ref --format '%(refname:short)' refs/heads | grep -v -e 'main\|master\|production' | xargs git branch -D"
alias groot='if [ "$(git rev-parse --show-cdup)" != "" ]; then cd $(git rev-parse --show-cdup); fi'
alias gpc='git pull -r && glean'
alias gsm='git switch $(basename $(git symbolic-ref --short refs/remotes/origin/HEAD))'
alias gsmp='gsm && gpc'
