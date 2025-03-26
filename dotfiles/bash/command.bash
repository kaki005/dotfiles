

settitle() {
  echo -ne "\033]0;'$1'\a"
}

cd() {
   builtin cd "$1"
  settitle "$(pwd | rev | awk -F \/ '{print $1}'| rev)" # tab名をcurrentDirectoryに
   if [[ $(ls | wc -l) -ge 10 ]]; then
    # print as grid
    eza -G -a -F --icons --group-directories-first --git --color=always --ignore-glob=".DS_Store|__*"
  else
    # print as list and add left padding
    eza -1 -a -F --icons --group-directories-first --git --color=always --ignore-glob=".DS_Store|__*" | sed 's/^/  /'
  fi
  if [ -d  ".git" ]; then # git 管理されているなら
    git pull
  fi
  if [ -d  ".venv" ]; then # python環境なら
    uv sync
  fi
}
