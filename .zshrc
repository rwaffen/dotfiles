# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/puppetlabs/bin:$PATH"
export PATH="/opt/puppetlabs/pdk/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# shell basics
alias ll='eza --long --header --binary --git --color-scale --icons'
alias find="gfind"
alias sed="gsed"
alias vim="nvim"

alias k=kubectl
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

# git aliases
alias glean="git branch --merged | egrep -v '(^\*|master|main|production)' | xargs git branch -D"
alias glean_all="git for-each-ref --format '%(refname:short)' refs/heads | grep -v -e 'main\|master\|production' | xargs git branch -D"
alias groot='if [ "$(git rev-parse --show-cdup)" != "" ]; then cd $(git rev-parse --show-cdup); fi'
alias gpc='git pull -r && glean'
alias gsm='git switch $(basename $(git symbolic-ref --short refs/remotes/origin/HEAD))'
alias gsmp='gsm && gpc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rwaffen/Applications/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rwaffen/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rwaffen/Applications/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rwaffen/Applications/google-cloud-sdk/completion.zsh.inc'; fi
