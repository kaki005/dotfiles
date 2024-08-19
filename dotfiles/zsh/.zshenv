export DOTFILES_DIR="$HOME/dotfiles"
export LANG=ja_JP.UTF-8
# ***************** PATH ************************
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
COMMAND_DIR="$DOTFILES_DIR/command"
export PATH=$COMMAND_DIR:$PATH

# Rye if exists
if [[ -s "$HOME/.rye/env" ]]; then
  . "$HOME/.rye/env"
fi


# pyenv
if [[ -s "$HOME/.pyenv/" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi


# Cargo
if [[ -s "$HOME/.cargo/" ]]; then
    . "$HOME/.cargo/env"
fi
