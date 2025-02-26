# =====================
# 環境変数
# =====================
# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PATH="$PATH:$HOME/homebrew/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH=$HOME/.local/share/mise/installs/julia/latest/bin:$PATH
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


# Source bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Source global alias
if [ -f /etc/profile.d/alias ]; then
	source /etc/profile.d/alias
fi

source /Users/kakiosatsukokorozashi/.config/broot/launcher/bash/br
