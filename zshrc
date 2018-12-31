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
#plugins=(osx git git-flow fabric python)
plugins=(osx git git-flow)

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
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/opt/macvim/bin:/usr/local/opt/vim/bin:$PATH

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
# python
#echo -n "Python ..."
#export PYTHONSTARTUP=~/.pyinit

#export PYTHONPATH=/usr/local/bin/python2.7:$PYTHONPATH
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
#export WORKON_HOME=~/.virtualenvs
#export PROJECT_HOME=$HOME/develop
#export VIRTUALENV_ROOT=$WORKON_HOME

# pip
#export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
#export PIP_REQUIRE_VIRTUALENV=true
#syspip(){
   #PIP_REQUIRE_VIRTUALENV="" pip "$@"
#}

#. /usr/local/bin/virtualenvwrapper.sh
#echo "done"

#echo -n "jython ..."
#export JYTHON_HOME=$(brew --prefix jython)/libexec
#export PATH=$PATH:$JYTHON_HOME/bin
#echo "done"

# echo "PYTHON: $(python -c 'import sys; print sys.prefix')"

#---------------------------------------------------------------------
# NODE.JS
#echo -n "node ..."
#export NODE_PATH=/usr/local/share/npm/lib
#export JS_CMD=node
# NVM
#export NVM_DIR=~/.nvm
#test -d "$NVM_DIR" || mkdir -p "$NVM_DIR"
#. $(brew --prefix nvm)/nvm.sh
#echo "done"

#---------------------------------------------------------------------
# GROOVY
# export GROOVY_HOME=$(brew --prefix groovy)/libexec

#---------------------------------------------------------------------
# alias
alias ls="gls --color"
alias la="ls -la"
alias ll="ls -l"
alias serve="python -mSimpleHTTPServer"

alias mve='mvim --servername $(basename $VIRTUAL_ENV)'

# ovr git plugin
alias gd="git icdiff"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# vargrant vmware clone directory
# Prevent cloning to a .vagrant dir which blows up time machine
# backups.
export VAGRANT_VMWARE_CLONE_DIRECTORY="~/.vagrant.d/vmware_clones"

# OPAM configuration
# . /Users/seletz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# GO
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/develop/go

# source /Users/seletz/.iterm2_shell_integration.zsh

# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk

# aws completion
# source /usr/local/share/zsh/site-functions/_aws
#
#

export PATH=$PATH:$(yarn global bin):$HOME/.config/yarn/global/node_modules/.bin

# Azure completion
. <(azure --completion)

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
