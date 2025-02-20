echo "Start setup ..."

if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    brew bundle install --global
    curl https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
    cp -f $DOTFILES_DIR/dotfiles/starship/fonts/0xProtoNerdFont-Regular.ttf ~/Library/Fonts/ # copy font
    mas install 539883307 # LINE
    mas install 1114591412 # Memory Clean 2
    mas install 803453959  # Slack
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
