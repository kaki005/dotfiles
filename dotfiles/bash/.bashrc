# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef
source $HOME/.rye/env
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source global alias
if [ -f /etc/profile.d/alias ]; then
	source /etc/profile.d/alias
fi

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
alias sb='source $HOME/.bashrc'


# =====================
# 環境変数
# =====================
# もろもろ環境変数を設定
export PATH=$PATH:/sbin:/usr/sbin # パス
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
export PS1="\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]\$ "
#export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'


# ====================
# コマンド
# ===================
cdls() {
    cd "$@" && ls
}
