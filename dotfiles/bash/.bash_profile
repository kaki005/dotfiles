# =====================
# 環境変数
# =====================
# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PATH="$PATH:$HOME/homebrew/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
export SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

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

export HIST_DIR="$HOME/.cache"
export HISTFILE="$HIST_DIR/.bash_history"
export PYTHONSTARTUP="$DOTFILES_DIR/dotfiles/python/.pythonrc.py"

export MPLCONFIGDIR="$HOME/.cache/matplotlib" # matplotlibのフォントファイル
export KERAS_HOME="$HOME/.cache/keras" # kerasのHome
export RYE_HOME="$HOME/.cache/rye"
export NVM_DIR="$HOME/.cache/nvm"
export GOPATH="$HOME/.local/share/go"
export LESSKEY=${DOTFILES_DIR}/dotfiles/less/lesskey

if uname -r | grep -qi microsoft; then
    export WINHOME="/mnt/c/Users/$(wslvar USERNAME)"
fi

# Source bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Source global alias
if [ -f /etc/profile.d/alias ]; then
	source /etc/profile.d/alias
fi
