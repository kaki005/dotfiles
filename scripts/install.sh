echo "Start setup ..."

if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    brew bundle install --global
    curl https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
fi
# Install mise dependencies
if type mise > /dev/null 2>&1; then
  mise install
fi
