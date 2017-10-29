#
# ~/.bashrc
#

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=vim
export PAGER=less
export HISTFILESIZE=500000

# fix: make java gui work with xmonad
export _JAVA_AWT_WM_NONREPARENTING=1

#
# path
#

export PATH=$HOME/bin:$PATH

# haskell
export PATH=$PATH:.cabal/bin

# initialize python virtualenvwrapper
export WORKON_HOME=~/local/virtualenvs/

#
# aliases
#

alias lt='ls -ltr'
alias mc='mc -d'
alias man="LANG=C man"
alias cal="cal -m"

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

_ps1_command()
{
  PS1_RETVAL=$?
  PS1_TIME=$(date +"%H:%M:%S")
  if [[ ${PS1_RETVAL} -eq 0 ]]; then
    PS1_RETVAL=""
  else
    PS1_RETVAL=" \[\033[1;31m\]${PS1_RETVAL}\[\033[0m\]"
  fi
  ${_PS1_COMMAND} "${PS1_COLOR_USER}\u\[\033[0m\]@\h ${PS1_TIME}${PS1_RETVAL} \w" "\n\$ " " (%s $(get_sha))"
}

_ps1_olderone()
{
  PS1="$1 $(__git_ps1 '(%s $(get_sha))')$2"
}

_ps1_fallback()
{
  PS1=$1$2
}

if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
  # for fedora 18+
  . /usr/share/git-core/contrib/completion/git-prompt.sh
  _PS1_COMMAND="__git_ps1"
elif [[ -f /etc/bash_completion.d/git ]]; then
  # for fedora 16,17 and rhel 6
  . /etc/bash_completion.d/git
  _PS1_COMMAND="_ps1_olderone"
elif type __git_ps1 > /dev/null 2>&1; then
  # otherwise at least try if we have __git_ps1 and try older one
  _PS1_COMMAND="_ps1_olderone"
else
  _PS1_COMMAND="_ps1_fallback"
fi

PROMPT_COMMAND='_ps1_command'

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

# git-cd needs to be a shell function to be able to change directory
# on the other hand this means that it can't be invoked by 'git cd' command
git-cd()
{
  # try to get root directory of git repo, exit if no repo found
  if ! GIT_ROOT=$(git rev-parse --show-toplevel); then
    return 1
  fi
  if [[ $# = 0 ]]; then
    # no arguments, cd right into the repo root
    cd ${GIT_ROOT}
  elif [[ "$1" = - ]]; then
    cd -
  else
    # otherwise cd wrt repo root
    cd "${GIT_ROOT}/$1"
  fi
}

# bash autocompletion for git-cd
_git-cd()
{
  if ! GIT_ROOT=$(git rev-parse --show-toplevel); then
    return 1
  fi
  # current word to complete
  local CUR=${COMP_WORDS[COMP_CWORD]}
  # remove absolute paths
  if [[ "$CUR" =~ ^/ ]]; then
    CUR=${CUR#"/"}
  fi
  COMPREPLY=($(cd $GIT_ROOT; compgen -S '/' -d $CUR))
}
complete -o nospace -F _git-cd git-cd
