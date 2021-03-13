#!/bin/bash

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

set -o emacs
PROMPT_DIRTRIM=2

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .="pwd"
alias c="clear && clear"
alias cp="cp -v"
alias df="df -Tha --total | column -t"
alias diff="diff --color=auto"
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias free="free -mt"
alias grep="grep --color=auto"
alias h="history"
alias ip="ip -color=auto"
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
alias ping="ping -c 5"
alias ps="ps auxf"
alias reload="source \$HOME/.bashrc && clear"
alias rm="rm -Iv"
alias t="tree"
alias tarc="tar czvf"
alias tart="tar tzvf"
alias x="exit"
if [ -f /usr/bin/pv ]; then
  alias hacker="clear && cat /dev/urandom | hexdump -C | pv -qL 10"
fi
if [ -f /usr/bin/cmatrix ]; then
  alias cmc="cmatrix && clear"
fi
if [ -f /usr/bin/bc ]; then
  alias bc="clear && bc -lq"
fi
if [ -f /usr/bin/asciiquarium ]; then
  alias aac="asciiquarium && clear"
fi
if [ -f /usr/bin/emacs ]; then
  alias cb="emacs \$HOME/.bashrc &"
  alias ce="emacs \$HOME/.emacs  &"
  alias enw="emacs -nw"
  e () { emacs "$@" & }
fi
if [ -d /data/projects ]; then
  alias p="cd /data/projects"
fi
if [ -f /usr/bin/sl ]; then
  alias sl="sl && clear"
fi
if [ -f /usr/bin/git ]; then
  alias addall="git add ."
  alias commit="git commit -m"
  alias push="git push origin main"
  alias status="git status"
fi
if [ -f /usr/bin/tmux ]; then
  alias ta="tmux attach-session -t"
  alias tl="tmux list-sessions"
  alias tm="tmux"
  alias tn="tmux new-session -s"
fi
if [ -f /usr/bin/vim ]; then
  alias cv="vim \$HOME/.vimrc"
  alias v="vim"
fi
if [ -f /usr/bin/bat ]; then
  alias cat="bat"
fi

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
export PS1=$'\n\w \U03BB '
export TERM=xterm-256color
export VISUAL="$EDITOR"

if [ -f /usr/bin/tldr ]; then
  export TLDR_CODE="red"
  export TLDR_DESCRIPTION="green"
  export TLDR_HEADER="magenta bold underline"
  export TLDR_PARAM="blue"
  export TLDR_QUOTE="italic"
fi

if [ -f "$HOME"/.fzf.bash ]; then
  execute_fzf="source $HOME/.fzf.bash" && eval "$execute_fzf" || return
  export FZF_DEFAULT_OPTS="-m --preview='head {}' --preview-window=right"
  if [ -f /usr/bin/rg ]; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
  fi
fi

upgrade_and_clean () {
  sudo paccache -rk0
  sudo pacman   -Rns "$(pacman -Qtdq)"
  sudo pacman   -Scc
  sudo pacman   -Syu
  if [ -f /usr/bin/paru ]; then
    paru -Sua
    paru -c && paru -Sc
  fi
  sudo updatedb
  clear
}

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
  if [ -z "$project_name" ]; then
    project_name="test"
  fi
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
  activate_command="source ./bin/activate"
  if [ -z "$project_name" ]; then
    project_name="test"
  fi
  if [ -d "$project_name" ]; then
    cd "$project_name" && eval "$activate_command" && cd src || return
    clear && echo "The project already exists ..." && echo "" && ls -la
    return
  fi
  python -m venv "$project_name"
  cd "$project_name" && eval "$activate_command"
  mkdir -p src && cd src || return
  pip install --upgrade pip
  pip install --upgrade autopep8 black flake8 ipython jedi mccabe
  pip install --upgrade pycodestyle pydocstyle pyflakes rope yapf
  pip install --upgrade 'python-language-server[all]'
  git init && git add . && git commit -m "Project created ..."
  clear && echo "Project created ..." && echo "" && ls -la && return
}

clear_kde_plasma () {
  rm -rf "$HOME"/.cache/plasma*
  rm -rf "$HOME"/.local/share/aurorae/*
  rm -rf "$HOME"/.local/share/color-schemes/*
  rm -rf "$HOME"/.local/share/plasma/*
  rm -rf "$HOME"/.local/share/wallpapers/*

  kquitapp5 plasmashell &
  kstart5   plasmashell &
}
