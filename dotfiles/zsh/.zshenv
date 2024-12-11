export DOTFILES_DIR="$HOME/dotfiles"
export LANG=ja_JP.UTF-8
# ***************** PATH ************************
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
COMMAND_DIR="$DOTFILES_DIR/command"
export PATH=$COMMAND_DIR:$PATH
export CPPFLAGS="-I/usr/local/opt/zlib/include"


# Rye if exists
if [[ -s "$HOME/.cache/rye/env" ]]; then
  . "$HOME/.cache/rye/env"
fi


# Cargo
if [[ -s "$HOME/.cargo/" ]]; then
    . "$HOME/.cargo/env"
fi
