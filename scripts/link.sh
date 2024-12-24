#!/bin/sh

# 関数の読み込み
dotfiles_root=$(cd $(dirname $0)/.. && pwd)
. ${dotfiles_root}/scripts/common.sh
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

if [ -d "/Applications/iTerm.app" ]; then
  dotfiles_echo "Setting up iTerm2 preferences..."

  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/dotfiles/iTerm"

  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi

if [ "$(uname)" = "Darwin" ]; then # macなら
    __ln ~/dotfiles/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    __ln ~/dotfiles/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    __ln ~/dotfiles/dotfiles/vscode/locale.json ~/Library/Application\ Support/Code/User/locale.json
    __ln ~/dotfiles/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
fi
