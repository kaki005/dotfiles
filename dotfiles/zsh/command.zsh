
iterm_tab_index() {
  osascript -e '
  tell application "iTerm2"
    tell current tab of current window
      sessions
    end tell
  end tell
  ' | awk '{printf ("%s\n", $6)}'
}


tab_color() {
  #ウィンドウのタブ色を変更
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab_reset() {
  zsh
  #ウィンドウのタブ色をリセット
  echo -ne "\033]6;1;bg;*;default\a"
}





chpwd() {
  current_dir="$(pwd | rev | awk -F \/ '{print $1}'| rev)" # tab名をcurrentDirectoryに
  set_tabtitle $current_dir
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
