export EDITOR=nvim
export RYE_HOME="$HOME/.cache/rye"
export NVM_DIR="$HOME/.cache/nvm"
export HIST_DIR="$HOME/.cache/zsh/" # .zshの履歴を保存するファイル
export HISTFILE="$HOME/.cache/zsh/" # .zshの履歴を保存するファイル
export LESSKEY=${DOTFILES_DIR}/dotfiles/less/lesskey
export PYTHONSTARTUP="$DOTFILES_DIR/dotfiles/python/.pythonrc.py"
export HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
export SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ
export MPLCONFIGDIR="$HOME/.cache/matplotlib" # matplotlibのフォントファイル
export KERAS_HOME="$HOME/.cache/keras" # kerasのHome
export GOPATH="$HOME/.local/share/go"
#export TLDR_HOME="$HOME/.cache/tldrc" # tldrの置き場

# ****************** C /C++ ********************
export MPIPATH="/usr/local/opt/open-mpi"
export C_INCLUDE_PATH="$MPIPATH/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$MPIPATH/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$MPIPATH/lib:$LIBRARY_PATH"

if uname -r | grep -qi microsoft; then
    export WINHOME="/mnt/c/Users/$(wslvar USERNAME)"
fi
