
# Source alias
source $DOTFILES_DIR/dotfiles/.alias

BASH_ROOTDIR="$DOTFILES_DIR/dotfiles/bash"
source $BASH_ROOTDIR/plugin.bash
source $BASH_ROOTDIR/config.bash
source $BASH_ROOTDIR/command.bash
echo ".bashrc load complated"
