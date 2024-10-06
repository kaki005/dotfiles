cd() {
   builtin cd "$1"

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
}