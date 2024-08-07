zinit ice depth=1; zinit light romkatv/powerlevel10k
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

