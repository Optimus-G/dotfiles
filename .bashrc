#!/bin/bash
PROMPT_DIRTRIM=2

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .="pwd"
alias c="clear && clear"
alias cp="cp -v"
alias df="df -Tha --total | column -t"
alias diff="diff -y --color=auto"
alias du="du -ach | sort -h"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias free="free -mt"
alias grep="grep --color=auto"
alias h="history"
alias ip="ip -color=auto"
alias j="jobs -l"
alias l="less"
alias la="ls -lahi --color=auto"
alias ll="ls -lhi --color=auto"
alias ln="ln -iv"
alias ls="ls -F --color=auto"
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

if [ -f /usr/bin/bat ]; then
  alias cat="bat"
fi

if [ -f /usr/bin/bc ]; then
  alias bc="clear && bc -lq"
fi

if [ -f /usr/bin/emacs ]; then
  alias cb="emacs \$HOME/.bashrc     &"
  alias ce="emacs \$HOME/.emacs.org  &"
  alias enw="emacs -nw"
  e () {
    emacs "$@" &
  }
fi

if [ -f /usr/bin/exa ]; then
  alias ls="exa"
fi

if [ -f /usr/bin/git ]; then
  alias addall="git add ."
  alias commit="git commit -m"
  alias push="git push origin main"
  alias status="git status"
fi

if [ -f /usr/bin/nano ]; then
  alias n="nano"
fi

if [ -d /data/projects ]; then
  alias p="cd /data/projects"
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

set   -o emacs

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

export EDITOR=emacs
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE=".:..:c:h:x:cd:la:ll:ls"
export HISTSIZE=10240
export PROMPT_COMMAND="history -a"
export PS1=$'\n\w \U00BB '
export TERM=xterm-256color
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VISUAL="$EDITOR"

if [ -f /usr/bin/cmake ]; then
  b () {
    if [ -d "$CURRENT_PROJECT_BUILD_PATH" ]; then
      cd "$CURRENT_PROJECT_BUILD_PATH" && scan-build cmake .. && scan-build make || return
    else
      return
    fi
  }
fi

if [ -f /usr/bin/fzf ]; then
  source /usr/share/fzf/completion.bash
  source /usr/share/fzf/key-bindings.bash
  export FZF_DEFAULT_OPTS="-m --preview='cat {}' --preview-window=right"
  if [ -f /usr/bin/rg ]; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
  fi
fi

if [ -f /opt/geant4/bin/geant4.sh ]; then
  source /opt/geant4/bin/geant4.sh
fi

if [ -f /usr/bin/opam ]; then
  eval "$(opam env)"
fi

print () {
  if [ -z "$1" ]; then return; fi
  print_file () {
    clear && realpath "$1"
    if [ -f /usr/bin/cloc ]; then cloc "$1"; fi
    while read -N 1 -r line; do
      echo -n "$line"
      sleep 0.03
    done < "$1" && echo
  }
  if [ -f "$1" ]; then
    print_file "$1"
  else
    for name in "$1"/*
    do
      if [ -d "$name" ]; then
        print "$name"
      else
        print_file "$name"
      fi
    done
  fi
}

upgrade_and_clean () {
  sudo pacman   -Syu
  sudo pacman   -Rns "$(pacman -Qtdq)"
  sudo pacman   -Scc
  sudo paccache -rk0

  if [ -f /usr/bin/paru ]; then
    paru -Sua
    paru -c && paru -Sc
  fi

  if [ -f /usr/bin/opam ]; then
    opam update  --all         --jobs=4
    opam upgrade --all --fixup --jobs=4
  fi

  if [ -f /usr/bin/rustup ]; then
    rustup update
  fi
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
  export CURRENT_PROJECT_BUILD_PATH
  if [ -z "$project_name" ]; then
    project_name="test_project"
  fi
  if [ -d "$project_name" ]; then
    CURRENT_PROJECT_BUILD_PATH=$(realpath "$project_name"/build)
    cd "$project_name" && clear
    echo "The project already exists ..." && echo "" && ls -la . && return
  else
    CMAKE_MINIMUM_VERSION="2.71.8...3.14.1"
    comment_line=$(seq -s "#" 80 | sed 's/[0-9]//g')
    mkdir -p "$project_name"/build
    mkdir -p "$project_name"/include
    mkdir -p "$project_name"/sources
    touch "$project_name"/sources/"$project_name".cc
    touch "$project_name"/include/"$project_name".hh
    CURRENT_PROJECT_BUILD_PATH=$(realpath "$project_name"/build)
    {
      echo "cmake_minimum_required(VERSION $CMAKE_MINIMUM_VERSION)"
      echo "$comment_line"
      echo "project($project_name)"
      echo "$comment_line"
      echo "set(CMAKE_BUILD_TYPE DEBUG)"
      echo "set(CMAKE_CXX_EXTENSIONS OFF)"
      echo "set(CMAKE_CXX_STANDARD 17)"
      echo "set(CMAKE_CXX_STANDARD_REQUIRED ON)"
      echo "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)"
      echo "set(CMAKE_CXX_FLAGS_RELEASE \"-O2 -ftree-vectorize -pipe\")"
      echo "set(CMAKE_CXX_FLAGS_DEBUG \"-g3 -Og -Wall -Wextra -Weffc++ -Wconversion -Wpedantic\")"
      echo "string(APPEND CMAKE_CXX_FLAGS_DEBUG \" -fsanitize=address -fsanitize=undefined\")"
      echo "string(APPEND CMAKE_CXX_FLAGS_DEBUG \" -fsanitize=leak -fstack-protector-all\")"
      echo "string(APPEND CMAKE_CXX_FLAGS_DEBUG \" -pedantic -pedantic-errors\")"
      echo "$comment_line"
      echo "include_directories(\${PROJECT_SOURCE_DIR}/include)"
      echo "$comment_line"
      echo "file(GLOB headers \${PROJECT_SOURCE_DIR}/include/*.hh)"
      echo "file(GLOB sources \${PROJECT_SOURCE_DIR}/sources/*.cc)"
      echo "$comment_line"
      echo "add_executable($project_name \${sources} \${headers})"
    } > "$project_name"/CMakeLists.txt
    cd "$CURRENT_PROJECT_BUILD_PATH" && cmake .. && cd .. || return
    ln -s build/compile_commands.json compile_commands.json
    ln -s build/compile_commands.json include/compile_commands.json
    ln -s build/compile_commands.json sources/compile_commands.json
    git init && git add . && git commit -m "C/C++ project created ..."
    clear && echo "C/C++ project created ..." && echo "" && ls -la . && return
  fi
}

create_geant4_project () {
  project_name=$1
  if [ -z "$project_name" ]; then
    project_name="test_geant4_project"
  fi
  create_project "$project_name"
  if [ -f /opt/geant4/bin/geant4.sh ]; then
    comment_line=$(seq -s "#" 80 | sed 's/[0-9]//g')
    {
      echo "$comment_line"
      echo "find_package(Geant4 REQUIRED multithreaded qt ui_all vis_all)"
      echo "include_directories(\${Geant4_INCLUDE_DIR})"
      echo "target_link_libraries($project_name \${Geant4_LIBRARIES})"
    } >> CMakeLists.txt
    cd "$CURRENT_PROJECT_BUILD_PATH" && cmake .. && cd .. || return
    git add . && git commit -m "Geant4 project created ..."
    clear && echo "Geant4 project created ..." && echo "" && ls -la . && return
  else
    echo "You need to install 'Geant4'"
  fi
}

create_ocaml_project () {
  project_name=$1
  if [ -z "$project_name" ]; then
    project_name="test_ocaml_project"
  fi
  if [ -d "$project_name" ]; then
    cd "$project_name" && clear
    echo "The project already exists ..." && echo "" && ls -la . && return
  else
    if [ -f /usr/bin/opam ]; then
      mkdir "$project_name" && cd "$project_name" || return
      dune init executable "$project_name" --libs base,containers,core
      echo "PKG base containers core" > .merlin
      git init && git add . && git commit -m "OCaml project created ..."
      clear && echo "OCaml project created ..." && echo "" && ls -la . && return
    else
      echo "You need to install 'dune' package"
    fi
  fi
}

create_python_project () {
  project_name=$1
  activate_command="source ./bin/activate"
  if [ -z "$project_name" ]; then
    project_name="test_python_project"
  fi
  if [ -d "$project_name" ]; then
    cd "$project_name" && eval "$activate_command" && cd src || return
    clear && echo "The project already exists ..." && echo "" && ls -la . && return
  else
    if [ -f /usr/bin/virtualenv ]; then
      python -m venv "$project_name"
      cd "$project_name" && eval "$activate_command"
      mkdir -p src && cd src || return
      pip install --upgrade pip
      pip install --upgrade 'python-lsp-server[all]'
      pip install --upgrade autopep8 black flake8 ipython jedi mccabe
      pip install --upgrade pycodestyle pydocstyle pyflakes rope yapf
      rm -rf "$(pip cache dir)"
      git init && git add . && git commit -m "Python project created ..."
      clear && echo "Python project created ..." && echo "" && ls -la && return
    else
      echo "You need to install 'python-virtualenv' package"
    fi
  fi
}

create_scientific_python_project () {
  project_name=$1
  activate_command="source ./bin/activate"
  if [ -z "$project_name" ]; then
    project_name="test_scientific_python_project"
  fi
  if [ -d "$project_name" ]; then
    create_python_project "$project_name"
  else
    create_python_project "$project_name"
    pip install --upgrade jupyter jupyterlab matplotlib nltk numpy pandas
    pip install --upgrade pypandoc scikit-image scikit-learn scipy sympy
    rm -rf "$(pip cache dir)"
    git add . && git commit -m "Scientific Python project created ..."
    clear && echo "Scientific Python project created ..." && echo "" && ls -la && return
  fi
}

av () {
  object_name=$1
  if [ -f /usr/bin/clamscan ]; then
    if [ ! -d "$HOME"/.clamav ]; then
      mkdir -p "$HOME"/.clamav
      mkdir -p "$HOME"/.clamav/log
      mkdir -p "$HOME"/.clamav/quarantine
    fi
    clamscan --bell \
             --infected \
             --recursive \
             --move="$HOME"/.clamav/quarantine \
             --log="$HOME"/.clamav/log/clamscan.log "$object_name"
  fi
}
