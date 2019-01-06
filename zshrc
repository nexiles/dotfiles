# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Fix path
eval $(/usr/libexec/path_helper)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git git-flow python)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# Customize to your needs...

case $TERM in
    *xterm*|ansi)
        function settab { print -Pn "\e]1;%n@%m: %~\a" }
        function settitle { print -Pn "\e]2;%n@%m: %~\a" }
        function chpwd { settab;settitle }
        settab;settitle
        ;;
esac

#---------------------------------------------------------------------
# prompt and path
# export PATH=~/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH
#export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/opt/macvim/bin:/usr/local/opt/vim/bin:$PATH
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

#---------------------------------------------------------------------
# env setup
export LANG="de_DE.UTF-8"
# gnuchlog vim plugin
export EMAIL="Stefan Eletzhofer <stefan.eletzhofer@nexiles.de>"
export EDITOR="vim"

# Homebrew:
# Error: GitHub API Error: API rate limit exceeded for 149.172.104.72. (But
# here's the good news: Authenticated requests get a higher rate limit. Check
# out the documentation for more details.)
export HOMEBREW_GITHUB_API_TOKEN="810e6f0a22cd05902e055ffa878e4f3a25eb05f2"

#---------------------------------------------------------------------
# java
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
echo "JAVA_HOME=$JAVA_HOME"

#---------------------------------------------------------------------
# alias
alias ls="gls --color"
alias la="ls -la"
alias ll="ls -l"
alias serve="python -mSimpleHTTPServer"

# ovr git plugin
alias gd="git icdiff"

# GO
export GOPATH=$HOME/develop/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

export PATH=$PATH:$(yarn global bin):$HOME/.config/yarn/global/node_modules/.bin

# direnv
. <(direnv hook zsh)
