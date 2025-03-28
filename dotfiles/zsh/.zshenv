export DOTFILES_DIR="$HOME/dotfiles"
export LANG=ja_JP.UTF-8
# ***************** PATH ************************
export PATH="/usr/local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
COMMAND_DIR="$DOTFILES_DIR/command"
export PATH=$COMMAND_DIR:$PATH
export PATH="/Users/skakio/.local/share/mise/shims:$PATH"
export PATH=$HOME/.local/share/mise/installs/julia/latest/bin:$PATH
# ****************** C /C++ ********************
export CPPFLAGS="-I/usr/local/opt/zlib/include:$CPPFLAGS"

# Rye if exists
if [[ -s "$HOME/.cache/rye/env" ]]; then
  . "$HOME/.cache/rye/env"
fi


# Cargo
if [[ -s "$HOME/.cargo/" ]]; then
    . "$HOME/.cargo/env"
fi



echo ".zshenv loaded"
