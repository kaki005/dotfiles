source $HOME/.rye/env
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source global alias
if [ -f /etc/profile.d/alias ]; then
	source /etc/profile.d/alias
fi
# Source alias
source ~/dotfiles/dotfiles/.alias

# ====================
# config
# ====================
# 新しく作られたファイルのパーミッションを 644 に
umask 022
# リダイレクションによるファイルの上書きを禁止
set -o noclobber
# cdコマンドの補完ではディレクトリのみを対象にする
complete -d cd
# =====================
# 環境変数
# =====================
# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PATH="$PATH:$HOME/homebrew/bin"
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
# オリジナルコマンド
COMMAND_DIR="$HOME/dotfiles/command"
export PATH=$COMMAND_DIR:$PATH
# 文字コード
case $TERM in
linux) LANG=C.UTF-8 ;;
*)     LANG=ja_JP.UTF-8 ;;
esac
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
DOTFILES_DIR="$HOME/dotfiles"

export HIST_DIR="$HOME/.history"
mkdir $HIST_DIR
export HISTFILE="$HIST_DIR/.bash_history"

# =====================
# プロンプトの表示
# =====================
source $DOTFILES_DIR/dotfiles/zsh/tool/git-completion.bash
source $DOTFILES_DIR/dotfiles/zsh/tool/git-prompt.sh
# addされていない変更の存在を「*」 commitされていない変更の存在を「+」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# addされていない新規ファイルの存在を「%」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stashがある場合は「$」で示す
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
#export PS1="[\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0;32m\]\h:\[\e[0;36m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]\$ "
#export PS1="\[\e[1;32m\]\u@\h\[\e[m\] \e[35m\t \[\e[1;36m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]\n\$ "
#export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'

# zoxyide
eval "$(zoxide init bash)"
# starshp
eval "$(starship init bash)"
# rtx
eval "$(~/.local/share/rtx/bin/rtx activate bash)"

# =====================
# alias
# =====================
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

echo ".bashrc load complated"
