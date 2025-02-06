
# Source alias
source $DOTFILES_DIR/dotfiles/.alias

BASH_ROOTDIR="$DOTFILES_DIR/dotfiles/bash"
source $BASH_ROOTDIR/plugin.bash
source $BASH_ROOTDIR/config.bash
source $BASH_ROOTDIR/command.bash
source $BASH_ROOTDIR/keybind.bash
source $BASH_ROOTDIR/export.bash
echo ".bashrc load complated"

dotfile_check
