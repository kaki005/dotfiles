# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef


# =====================
# alias
# ====================
# よく使うエイリアスやら各コマンドのデフォルトのオプションを設定
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias python='python3'
# lsの結果を色付きで表示してくれる
alias ls="ls --color=auto"
# ○○するときに、本当に○○していいか聞いてくれる系のエイリアス
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ..='cd ..'
# git系のエイリアス
alias gb="git branch"
alias gco='git checkout'
alias gcm='git checkout master'
alias gl='git pull'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias ga='git add'


# ======================
# 環境変数
# =====================
# プロンプトの表示をカスタマイズ
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'

# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
export LANG='ja_JP.UTF-8' # 以下 3 つ文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# ====================
# コマンド
# ===================
cdls() {
    cd "$@" && ls
}
