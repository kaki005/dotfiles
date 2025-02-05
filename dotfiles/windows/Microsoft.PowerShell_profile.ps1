Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\dotfiles\dotfiles\starship\starship.toml"
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})



Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete # Tabキーで補完
Set-PSReadlineOption -HistoryNoDuplicates # 重複しないようにする
Set-PSReadLineOption -PredictionSource History # 予測インテリセンス
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord # Ctrl+fで補完されたものに決定する


# alias
${function:~} = { Set-Location ~ }
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:dt} = { Set-Location ~\Desktop }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
${function:ls} = {eza --color=auto --icons}
${function:ll} = {eza -l --color=auto --icons --header --git}
${function:la} = {eza -la --icons --header --git }
${function:cd} = {z}

Set-Alias grep Select-String
Set-Alias uniq Get-Unique
Set-Alias zip Compress-Archive
Set-Alias mkdir New-Item
Set-Alias finder Invoke-Item
