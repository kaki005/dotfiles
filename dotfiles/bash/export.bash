export PATH="/mnt/c/Tool/Code/bin:$PATH"


export HIST_DIR="$HOME/.cache"
export HISTFILE="$HIST_DIR/.bash_history"
export PYTHONSTARTUP="$DOTFILES_DIR/dotfiles/python/.pythonrc.py"

export EZA_CONFIG_DIR="$HOME/.config/eza/"
export MPLCONFIGDIR="$HOME/.cache/matplotlib" # matplotlibのフォントファイル
export KERAS_HOME="$HOME/.cache/keras" # kerasのHome
export RYE_HOME="$HOME/.cache/rye"
export NVM_DIR="$HOME/.cache/nvm"
export GOPATH="$HOME/.local/share/go"
export ZDOTDIR="$HOME/.cache/zsh" # .zcompdumpの置き場所

export PAGER=less
export MANPAGER='nvim +Man!'
export LESSHISTFILE="$HOME/.cache/.lesshist"
export LESS="-i -q -x2 -N -R"
export LESSCHARSET="utf-8"
export LESSOPEN="| highlight %s"

if uname -r | grep -qi microsoft; then
    export WINHOME="/mnt/c/Users/$(wslvar USERNAME)"
fi
