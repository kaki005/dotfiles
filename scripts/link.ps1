New-Item -ItemType SymbolicLink -Path $HOME -Name .vimrc -Value $HOME\dotfiles\dotfiles\vim\.vimrc
New-Item -ItemType SymbolicLink -Path $HOME -Name .gitconfig -Value $HOME\dotfiles\dotfiles\git\.gitconfig
New-Item -ItemType SymbolicLink -Path $HOME -Name .wezterm.lua -Value $HOME\dotfiles\dotfiles\wezterm\.wezterm.lua


New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name settings.json -Value $HOME\dotfiles\dotfiles\vscode\settings.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name keybindings.json -Value $HOME\dotfiles\dotfiles\vscode\keybindings.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name locale.json -Value $HOME\dotfiles\dotfiles\vscode\locale.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name snippets -Value $HOME\dotfiles\dotfiles\vscode\snippets
# New-Item -ItemType SymbolicLink -Path $HOME -Name .bashrc -Value $HOME\dotfiles\bash\.bashrc_win_git_bash