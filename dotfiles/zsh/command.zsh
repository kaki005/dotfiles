update_all_repos ()
{
    ghq list | ghq get --update --parallel
}

# https://github.com/motemen/github-list-starred
get_starred_repos ()
{
    local n_repos=${1:-10}
    github-list-starred yiskw713 | head -n $n_repos | ghq get --parallel
}


if [[ $(command -v exa) ]]; then
    alias exa="eza -a --icons --git -h -g"
    alias ls="eza"
fi
cdls ()
{
    cd "$@"
}
