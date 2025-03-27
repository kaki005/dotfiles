#!/bin/sh

# 関数の読み込み
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
. ${dotfiles_root}/scripts/common.sh

# シンボリックリンクを削除
cd ${dotfiles_root}/dotfiles
for linklist in "linklist.Unix.txt" "linklist.$(uname).txt"; do
    [ ! -r "${linklist}" ] && continue

    __remove_linklist_comment "$linklist" | while read target link; do
        # ~ や環境変数を展開
        link=$(eval echo "${link}")
        # シンボリックリンクを作成
        __unlink ${link}
    done
done

# macなら
if [ "$(uname)" = "Darwin" ]; then 
    __unlink ~/dotfiles/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    __unlink ~/dotfiles/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    __unlink ~/dotfiles/dotfiles/vscode/locale.json ~/Library/Application\ Support/Code/User/locale.json
    __unlink ~/dotfiles/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
fi