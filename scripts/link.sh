#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

cd ${dotfiles_root}/dotfiles
for linklist in "linklist.Unix.txt" "linklist.$(uname).txt"; do
    [ ! -r "${linklist}" ] && continue

    __remove_linklist_comment "$linklist" | while read target link; do
        # ~ や環境変数を展開
        target=$(eval echo "${PWD}/${target}")
        link=$(eval echo "${link}")
        # シンボリックリンクを作成
        mkdir -p $(dirname ${link})
        ln -fsn ${target} ${link}
    done
done

