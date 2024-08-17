export EDITOR=nvim
eval "$(direnv hook zsh)"
export LANG=ja_JP.UTF-8

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export DOTFILES_DIR="$HOME/dotfiles"
COMMAND_DIR="$DOTFILES_DIR/command"
export PATH=$COMMAND_DIR:$PATH
