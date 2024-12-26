# コマンド履歴検索
peco_history_selection() {
  local selected_command=$(history | tac | awk '{$1=""; print substr($0,2)}' | peco)
  if [ -n "$selected_command" ]; then
    # READLINE_LINE="$selected_command" # 現在のコマンドラインを変更
    # READLINE_POINT=${#selected_command} # カーソル位置を変更
    builtin eval "$selected_command"  # コマンドを即時実行
  fi
}
bind -x '"\C-r": peco_history_selection' # Crl + r

# コマンド履歴からディレクトリ検索・移動
peco_cdr() {
  local recent_dirs_file="$HOME/.cache/chpwd-recent-dirs"
  if [ ! -f "$recent_dirs_file" ]; then
    touch "$recent_dirs_file"
  fi
  local selected_dir=$(tac "$recent_dirs_file" | peco)
  if [ -n "$selected_dir" ]; then
    # READLINE_LINE="cd $selected_dir"
    # READLINE_POINT=${#READLINE_LINE}
    builtin eval "cd $selected_dir"  # コマンドを即時実行
  fi
}
bind -x '"\C-q": peco_cdr'  # Crl + q

# カレントディレクトリ以下のディレクトリ検索・移動
find_cd() {
  local selected_dir=$(find . -type d | peco)
  if [ -n "$selected_dir" ]; then
    # READLINE_LINE="cd $selected_dir"
    # READLINE_POINT=${#READLINE_LINE}
    builtin eval "cd $selected_dir"  # コマンドを即時実行
  fi
}
bind -x '"\C-w": find_cd'   # Crl + w

# ghqとの連携。repositoryを選んで移動
peco_src() {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >")
  if [ -n "$selected_dir" ]; then
    # READLINE_LINE="cd $selected_dir && git pull"
    # READLINE_POINT=${#READLINE_LINE}
    builtin eval "cd $selected_dir && git pull"  # コマンドを即時実行
  fi
}
bind -x '"\C-]": peco_src'  # Crl + }
