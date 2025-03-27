echo "Start setup ..."

if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    brew bundle install --global
    curl https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
    curl -L https://github.com/SoichiroYamane/sketchybar-app-font-bg/releases/download/v0.0.2/sketchybar-app-font-bg.ttf -o $HOME/Library/Fonts/sketchybar-app-font-bg.ttf
    git clone git@github.com:joncrangle/sketchybar-system-stats.git "$HOME"/.local/share
    cargo build --manifest-path "$HOME"/.local/share/stats_provider/Cargo.toml --release
    brew services start sketchybar
    cp -f $DOTFILES_DIR/dotfiles/starship/fonts/0xProtoNerdFont-Regular.ttf ~/Library/Fonts/ # copy font
    mas install 539883307 # LINE
    mas install 1114591412 # Memory Clean 2
    mas install 803453959  # Slack
    # SbarLua
    (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/ )
    sh $HOME/dotfiles/dotfiles/sketchybar/scripts/icon_updater.sh
fi
# Install mise dependencies
if type mise > /dev/null 2>&1; then
  mise install
fi
# set cache directory
npm config set cache $HOME/.cache/npm


cat ~/dotfiles/dotfiles/vscode/extensions.txt | while read line
do
 code --install-extension $line
done
