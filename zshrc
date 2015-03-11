# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

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
plugins=(osx git git-flow fabric python)

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
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH

#---------------------------------------------------------------------
# env setup
export LANG="de_DE.UTF-8"
# gnuchlog vim plugin
export EMAIL="Stefan Eletzhofer <stefan.eletzhofer@nexiles.de>"
export EDITOR="vim"

#---------------------------------------------------------------------
# java
export JAVA_HOME=$(/usr/libexec/java_home -v1.7)
echo "JAVA_HOME=$JAVA_HOME"

#---------------------------------------------------------------------
# python
#export PYTHONSTARTUP=~/.pyinit

# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.6
export PYTHONPATH=/usr/local/bin/python2.7:$PYTHONPATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/develop
export VIRTUALENV_ROOT=$WORKON_HOME


export JYTHON_HOME=$(brew --prefix jython)/libexec
# export JYTHON_HOME=/usr/local/Cellar/jython/2.5.3b1/libexec
export PATH=$PATH:$JYTHON_HOME/bin

# pip
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PIP_REQUIRE_VIRTUALENV=true
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

. /usr/local/bin/virtualenvwrapper.sh

echo "PYTHON: $(python -c 'import sys; print sys.prefix')"

#---------------------------------------------------------------------
# NODE.JS
export NODE_PATH=/usr/local/share/npm/lib
export JS_CMD=node

#---------------------------------------------------------------------
# Ruby RVM
source ~/.rvm/scripts/rvm

#---------------------------------------------------------------------
# GROOVY
export GROOVY_HOME=$(brew --prefix groovy)/libexec

#---------------------------------------------------------------------
# alias
alias ls="gls --color"
alias la="ls -la"
alias ll="ls -l"
alias serve="python -mSimpleHTTPServer"

alias mve='mvim --servername $(basename $VIRTUAL_ENV)'

# ovr git plugin
alias gd="git icdiff"

#---------------------------------------------------------------------
# direnv hook
# eval `direnv hook $0`

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# vargrant vmware clone directory
# Prevent cloning to a .vagrant dir which blows up time machine
# backups.
export VAGRANT_VMWARE_CLONE_DIRECTORY="~/.vagrant.d/vmware_clones"

# Pyenv
export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null
then
    eval "$(pyenv init -)"
fi

# OPAM configuration
. /Users/seletz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
