
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

source /Users/kakiosatsukokorozashi/.config/broot/launcher/bash/br
export PATH="/opt/home/kakinotane1456/.pixi/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/home/kakinotane1456/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/home/kakinotane1456/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/opt/home/kakinotane1456/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/home/kakinotane1456/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/home/kakinotane1456/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/opt/home/kakinotane1456/Documents/Git/github.com/kaki005/LabPaperCode/Lab/CubeScope_original/yes';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
