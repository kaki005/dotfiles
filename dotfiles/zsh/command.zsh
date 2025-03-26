

settitle() {
  echo -ne "\033]0;$1\007"
}




chpwd() {
  current_dir="$(pwd | rev | awk -F \/ '{print $1}'| rev)" # tab名をcurrentDirectoryに
  settitle $current_dir
  if [[ $(ls | wc -l) -ge 10 ]]; then
    # print as grid
    eza -G -a -F --icons --group-directories-first --git --color=always --ignore-glob=".DS_Store|__*"
  else
    # print as list and add left padding
    eza -1 -a -F --icons --group-directories-first --git --color=always --ignore-glob=".DS_Store|__*" | sed 's/^/  /'
  fi
  if [ -e  ".git" ]; then # git 管理されているなら
    git pull
  fi
  if [ -e  ".venv" ]; then # python環境なら
    uv sync
  fi
}
