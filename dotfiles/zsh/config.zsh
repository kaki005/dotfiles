#################################  HISTORY  #################################

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
# setopt share_history        # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_all_dups    # 同じコマンドをhistoryに残さない
setopt hist_ignore_space       # historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks      # historyに保存するときに余分なスペースを削除する
setopt hist_save_no_dups       # 重複するコマンドが保存されるとき、古い方を削除する

#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''


### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2


#################################  OTHERS  #################################
# automatically change directory when dir name is typed
setopt auto_cd
## パスを直接入力してもcdする
setopt AUTO_CD
## 環境変数を補完
setopt AUTO_PARAM_KEYS
# disable ctrl+s, ctrl+q
setopt no_flow_control
# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep
# 特殊文字をエスケープしない
setopt +o nomatch
