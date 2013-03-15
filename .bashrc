#
# ~/.bashrc
#

. /etc/bashrc
. /usr/share/git-core/contrib/completion/git-prompt.sh

export EDITOR=vim
export PAGER=less
export HISTFILESIZE=500000

#
# path
#

export PATH=$HOME/bin:$PATH

# haskell
export PATH=$PATH:.cabal/bin

# java
export CLASSPATH=$CLASSPATH:"$HOME/local/javalib"

# python
export PYTHON=python2
export PYTHONPATH=$PYTHONPATH:"$HOME/local/pylib"

# ruby
export GEM_HOME="$HOME/local/rubygems/"

#
# aliases
#

alias lt='ls -ltr'
alias vim='vim -p'
alias mc='mc -d'
alias man="LANG=C man"
alias cal="cal -m"

alias msplayer="mplayer -user-agent 'NSPlayer/0 (MPlayer; Linux)'"

#
# PS1 prompt
#

#"\[\033[0;30m\]" # black
#"\[\033[0;31m\]" # red
#"\[\033[0;32m\]" # green
#"\[\033[0;33m\]" # yellow
#"\[\033[0;34m\]" # blue
#"\[\033[0;35m\]" # magenta
#"\[\033[0;36m\]" # cyan
#"\[\033[0;37m\]" # white
#"\[\033[1;30m\]" # light black
#"\[\033[1;31m\]" # light red
#"\[\033[1;32m\]" # light green
#"\[\033[1;33m\]" # light yellow
#"\[\033[1;34m\]" # light blue
#"\[\033[1;35m\]" # light magenta
#"\[\033[1;36m\]" # light cyan
#"\[\033[1;37m\]" # light white
#"\[\033[40m\]"   # backgr black
#"\[\033[41m\]"   # backgr red
#"\[\033[42m\]"   # backgr green
#"\[\033[43m\]"   # backgr yellow
#"\[\033[44m\]"   # backgr blue
#"\[\033[45m\]"   # backgr magenta
#"\[\033[46m\]"   # backgr cyan
#"\[\033[47m\]"   # backgr white

PS1_COLOR_USER="\[\033[1;33m\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

ps1_setup()
{
  PS1_RETVAL=$?
  PS1_TIME=$(date +"%H:%M:%S")
  if [[ ${PS1_RETVAL} -eq 0 ]]; then
    PS1_RETVAL=""
  else
    PS1_RETVAL=" \[\033[1;31m\]${PS1_RETVAL}\[\033[0m\]"
  fi
}

ps1_fallback()
{
  PS1=$1$2
}

if type __git_ps1 > /dev/null 2>&1; then
  _PS1_COMMAND="__git_ps1"
else
  _PS1_COMMAND="ps1_fallback"
fi

PROMPT_COMMAND='ps1_setup;${_PS1_COMMAND} "${PS1_COLOR_USER}\u\[\033[0m\]@\h ${PS1_TIME}${PS1_RETVAL} \w" "\n\$ " " (%s $(get_sha))"'

#
# other functions
#

mkcd()
{
  if [[ -d $1 ]]; then
    echo "mkcd: directory \"$1\" already exists" >&2
  else
    mkdir $1
  fi
  cd $1
}

psgrep()
{ 
  if [[ ! -z $1 ]]; then
    ps aux | grep --color=auto "$1" | grep --color=auto -v grep
  else
    echo "psgrep: no name to grep for" >&2
  fi
}

get_dir()
{
    printf "%s" $(pwd | sed "s:$HOME:~:")
}

get_sha()
{
    git rev-parse --short HEAD 2>/dev/null
}