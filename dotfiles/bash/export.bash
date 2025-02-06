export PATH="/mnt/c/Tool/Code/bin:$PATH"


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
