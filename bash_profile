
#---------------------------------------------------------------------
# prompt and path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

export PS1="\[\033[01;32m\] \u@\h: \W \[\033[00m\]$ "

#---------------------------------------------------------------------
# env setup
export LANG="de_DE.UTF-8"
# gnuchlog vim plugin
export EMAIL="Stefan Eletzhofer <stefan.eletzhofer@nexiles.de>"
export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim -g -f "

#---------------------------------------------------------------------
# python
export PYTHONSTARTUP=~/.pyinit

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.6
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/develop
export VIRTUALENV_ROOT=$WORKON_HOME

export JYTHON_HOME=/usr/local/Cellar/jython/2.5.1/libexec
export PATH=$PATH:$JYTHON_HOME/bin

. /usr/local/bin/virtualenvwrapper.sh

# New cd function that does the virtualenv magic
function venv_cd {
    cd "$@" && eval $(python ~/bin/venv_cd.py)
}

alias cd="venv_cd"

#---------------------------------------------------------------------
# history
shopt -s histappend
export HISTFILESIZE=100000
test -d ~/.hist || {
    mkdir ~/.hist
    chmod 700 ~/.hist
}
export HISTFILE=$HOME/.hist/bash-history-$(date +"%Y-%m-%d")
export HISTTIMEFORMAT="%s "

function hgrep() {
	grep -R $1 ~/.hist
}

#---------------------------------------------------------------------
# alias
alias ls="gls --color"
alias la="ls -la"
alias ll="ls -l"
alias serve="python -mSimpleHTTPServer"

#---------------------------------------------------------------------
# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

complete -C "mite auto-complete" mite

