New-Item -ItemType SymbolicLink -Path $HOME -Name .vimrc -Value $HOME\dotfiles\dotfiles\vim\.vimrc
New-Item -ItemType SymbolicLink -Path $HOME -Name .gitconfig -Value $HOME\dotfiles\dotfiles\git\.gitconfig
New-Item -ItemType SymbolicLink -Path $HOME -Name .wezterm.lua -Value $HOME\dotfiles\dotfiles\wezterm\.wezterm.lua
New-Item -ItemType SymbolicLink -Path C:\Windows\Fonts -Name 0xProtoNerdFont-Regular.ttf -Value $HOME\dotfiles\dotfiles\starship\fonts\0xProtoNerdFont-Regular.ttf
New-Item -ItemType SymbolicLink -Path $HOME\Documents\PowerShell -Name Microsoft.PowerShell_profile.ps1 -Value $HOME/dotfiles/dotfiles/windows/Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\clink -Name clink_settings -Value $HOME/dotfiles/dotfiles/windows/clink_settings
New-Item -ItemType SymbolicLink -Path $env:LOCALAPPDATA\clink -Name aliases -Value $HOME/dotfiles/dotfiles/windows/aliases
New-Item -ItemType SymbolicLin -Path $env:LOCALAPPDATA\clink -Name plugin.lua -Value $HOME/dotfiles/dotfiles/windows/plugin.lua
# Vscode
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name settings.json -Value $HOME\dotfiles\dotfiles\vscode\settings.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name keybindings.json -Value $HOME\dotfiles\dotfiles\vscode\keybindings.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name locale.json -Value $HOME\dotfiles\dotfiles\vscode\locale.json
New-Item -ItemType SymbolicLink -Path $HOME\AppData\Roaming\Code\User -Name snippets -Value $HOME\dotfiles\dotfiles\vscode\snippets
# New-Item -ItemType SymbolicLink -Path $HOME -Name .bashrc -Value $HOME\dotfiles\bash\.bashrc_win_git_bash

New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.glzr -Name zebar -Value $HOME\dotfiles\dotfiles\windows\.glzr/zebar
