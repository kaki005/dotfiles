#zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma/fast-syntax-highlighting
zinit light paulirish/git-open
zinit load "mafredri/zsh-async"
zinit load "chrissicool/zsh-256color"

# bat command
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
# 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi

# riggrep
zinit wait lucid light-mode as'program' from'gh-r' for \
    pick'ripgrep*/rg' @'BurntSushi/ripgrep'

# starship
eval "$(starship init zsh)"


SCRIPT_DIR=$DOTFILES_DIR/dotfiles/zsh
TOOL_DIR=$SCRIPT_DIR/tool
#source $TOOL_DIR/p10k.zsh
source $TOOL_DIR/git-prompt.sh  # git-promptの読み込み
fpath=(~/zsh $fpath)
zstyle ':completion:*:*:git:*' script $SCRIPT_DIR/tool/git-completion.bash # git-completionの読み込み
autoload -Uz compinit && compinit
# cd-gitroot
fpath=($TOOL_DIR $fpath)
autoload -Uz cd-gitroot

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
