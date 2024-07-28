zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma/fast-syntax-highlighting
zinit light paulirish/git-open

# bat command
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
# 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi

# exa
zinit ice as"program" from"gh-r" mv"eza* -> eza"
zinit light eza-community/eza

# riggrep
zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

#fd
zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd
