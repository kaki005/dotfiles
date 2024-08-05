#!/bin/sh

# 関数の読み込み
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
. ${dotfiles_root}/scripts/common.sh
export $APPDATA="~/Library/Application Support"
# シンボリックリンクを作成
cd ${dotfiles_root}/dotfiles
for linklist in "linklist.Unix.txt" "linklist.$(uname).txt"; do
    [ ! -r "${linklist}" ] && continue

    __remove_linklist_comment "$linklist" | while read target link; do
        # ~ や環境変数を展開
        target=$(eval echo "${PWD}/${target}")
        link=$(eval echo "${link}")
        # シンボリックリンクを作成
        __mkdir $(dirname ${link})
        __ln ${target} ${link}
    done
done

if [ "$(uname)" == 'Darwin' ]; then
    __ln "vscode/User/settings.json " "~/Library/Application\ Support/Code/User/settings.json"
    __ln "vscode/User/keybindings.json " "~/Library/Application\ Support/Code/User/keybindings.json"
    __ln "vscode/User/locale.json " "~/Library/Application\ Support/Code/User/locale.json"
    __ln "vscode/User/snippets " "~/Library/Application\ Support/Code/User/snippets"
fi
