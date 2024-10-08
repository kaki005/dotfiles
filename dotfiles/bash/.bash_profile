# =====================
# 環境変数
# =====================
# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PATH="$PATH:$HOME/homebrew/bin"
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す

export DOTFILES_DIR="$HOME/dotfiles"
COMMAND_DIR="$DOTFILES_DIR/command"
export PATH=$COMMAND_DIR:$PATH
# 文字コード
case $TERM in
linux) LANG=C.UTF-8 ;;
*)     LANG=ja_JP.UTF-8 ;;
esac
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

export HIST_DIR="$HOME/.history"
mkdir $HIST_DIR
export HISTFILE="$HIST_DIR/.bash_history"

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
# Source global alias
if [ -f /etc/profile.d/alias ]; then
	source /etc/profile.d/alias
fi
