source $DOTFILES_DIR/dotfiles/zsh/tool/git-completion.bash
# =====================
# プロンプトの表示 (Obsolete)
# =====================
source $DOTFILES_DIR/dotfiles/zsh/tool/git-prompt.sh
# # addされていない変更の存在を「*」 commitされていない変更の存在を「+」で示す
# GIT_PS1_SHOWDIRTYSTATE=true
# # addされていない新規ファイルの存在を「%」で示す
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true # stashがある場合は「$」で示す
# GIT_PS1_SHOWUPSTREAM=auto
#export PS1="[\[\e[0;32m\]\u\[\e[0;33m\]@\[\e[0;32m\]\h:\[\e[0;36m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]\$ "
#export PS1="\[\e[1;32m\]\u@\h\[\e[m\] \e[35m\t \[\e[1;36m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]\n\$ "
#export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'


# =====================
# Other
# =====================

eval "$(zoxide init bash)" # zoxyide
eval "$(starship init bash)" # starshp
eval "$(mise activate bash)" # mise
