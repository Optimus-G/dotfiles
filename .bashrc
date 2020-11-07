#!/bin/bash

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

set -o emacs
PROMPT_DIRTRIM=2

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .="pwd"
alias aac="asciiquarium && clear"
alias addall="git add ."
alias bc="clear && bc -lq"
alias c="clear && clear"
alias cb="emacs $HOME/.bashrc &"
alias ce="emacs $HOME/.emacs  &"
alias cmc="cmatrix && clear"
alias commit="git commit -m"
alias cp="cp -v"
alias cv="vim $HOME/.vimrc"
alias df="df -Tha --total | column -t"
alias du="du -ach | sort -h"
alias e="emacs"
alias egrep="egrep --color=auto"
alias enw="emacs -nw"
alias ff="find . -type f -iname"
alias fgrep="fgrep --color=auto"
alias fm="ranger"
alias free="free -mt"
alias grep="grep --color=auto"
alias h="history"
alias hacker="clear && cat /dev/urandom | hexdump -C | pv -qL 10"
alias j="jobs -l"
alias l="less"
alias la="ls -lah --color=auto"
alias ll="ls -lh  --color=auto"
alias ln="ln -iv"
alias ls="ls -F   --color=auto"
alias m="more"
alias me="chmod a+x"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias p="cd /data/projects"
alias ping="ping -c 5"
alias ps="ps auxf"
alias push="git push origin main"
alias reload="source $HOME/.bashrc"
alias rm="rm -Iv"
alias sc="systemctl"
alias sl="sl && clear"
alias status="git status"
alias t="tree"
alias ta="tmux attach-session -t"
alias tarc="tar czvf"
alias tart="tar tzvf"
alias tl="tmux list-sessions"
alias tm="tmux"
alias tn="tmux new-session -s"
alias v="vim"
alias x="exit"

shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s globstar
shopt -s histappend
shopt -s histreedit

export EDITOR=vim
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE=".:..:c:h:x:cd:la:ll:ls"
export HISTSIZE=10240
export PROMPT_COMMAND="history -a"
export PS1=$'\n\w \U27A4 '
export TERM=xterm-256color
export VISUAL="$EDITOR"

if [ -f /usr/bin/tldr ]; then
  export TLDR_CODE="red"
  export TLDR_DESCRIPTION="green"
  export TLDR_HEADER="magenta bold underline"
  export TLDR_PARAM="blue"
  export TLDR_QUOTE="italic"
fi

if [ -f "$HOME/.fzf.bash" ]; then
  source "$HOME/.fzf.bash"
  export FZF_DEFAULT_OPTS="-m --preview='head {}' --preview-window=right"
  if [ -f /usr/bin/rg ]; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
  fi
fi

extract () {
  archive=$1
  if [ -f "$archive" ]; then
    case "$archive" in
      *.tar.bz2 ) tar        xjvf "$archive" ;;
      *.tar.gz  ) tar        xzvf "$archive" ;;
      *.bz2     ) bunzip2         "$archive" ;;
      *.rar     ) unrar      e    "$archive" ;;
      *.gz      ) gunzip          "$archive" ;;
      *.tar     ) tar        xvf  "$archive" ;;
      *.tbz2    ) tar        xjvf "$archive" ;;
      *.tgz     ) tar        xzvf "$archive" ;;
      *.zip     ) unzip           "$archive" ;;
      *.Z       ) uncompress      "$archive" ;;
      *.7z      ) 7z         x    "$archive" ;;
      *         ) echo            "$archive" ;;
    esac
  else
    echo "Extract ERROR!" && return
  fi
}

create_project () {
  project_name=$1
  if [ -d "$project_name" ]; then
    cd "$project_name/src" && clear
    echo "The project already exists ..."
    echo "" && ls -la . && return
  fi
  mkdir -p "$project_name/src" && cd "$project_name/src" || return
  git init && git add . && git commit -m "Project created ..."
  clear && echo "Project created ..." && echo "" && ls -la . && return
}

create_python_project () {
  project_name=$1
  activate_command=./bin/activate
  if [ -d "$project_name" ]; then
    cd "$project_name" && source "$activate_command" && cd src || return
    clear && echo "The project already exists ..." && echo "" && ls -la
    return
  fi
  python -m venv "$project_name"
  cd "$project_name" && source "$activate_command"
  mkdir -p src && cd src || return
  pip install --upgrade pip
  pip install --upgrade autopep8 black flake8 ipython jedi mccabe
  pip install --upgrade pycodestyle pydocstyle pyflakes rope yapf
  pip install --upgrade 'python-language-server[all]'
  git init && git add . && git commit -m "Project created ..."
  clear && echo "Project created ..." && echo "" && ls -la && return
}
