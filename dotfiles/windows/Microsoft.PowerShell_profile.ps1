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





$env:MISE_SHELL = 'pwsh'
$env:__MISE_ORIG_PATH = $env:PATH

function mise {
    # Read line directly from input to workaround powershell input parsing for functions
    $code = [System.Management.Automation.Language.Parser]::ParseInput($MyInvocation.Statement.Substring($MyInvocation.OffsetInLine - 1), [ref]$null, [ref]$null)
    $myLine = $code.Find({ $args[0].CommandElements }, $true).CommandElements | ForEach-Object { $_.ToString() } | Join-String -Separator ' '
    $command, [array]$arguments = Invoke-Expression ('Write-Output -- ' + $myLine)

    if ($null -eq $arguments) {
        & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe
        return
    }

    $command = $arguments[0]
    $arguments = $arguments[1..$arguments.Length]

    if ($arguments -contains '--help') {
        return & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe $command $arguments
    }

    switch ($command) {
        { $_ -in 'deactivate', 'shell', 'sh' } {
            if ($arguments -contains '-h' -or $arguments -contains '--help') {
                & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe $command $arguments
            }
            else {
                & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe $command $arguments | Out-String | Invoke-Expression -ErrorAction SilentlyContinue
            }
        }
        default {
            & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe $command $arguments
            $status = $LASTEXITCODE
            if ($(Test-Path -Path Function:\_mise_hook)){
                _mise_hook
            }
            # Pass down exit code from mise after _mise_hook
            pwsh -NoProfile -Command exit $status
        }
    }
}

function Global:_mise_hook {
    if ($env:MISE_SHELL -eq "pwsh"){
        & $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe hook-env $args -s pwsh | Out-String | Invoke-Expression -ErrorAction SilentlyContinue
    }
}

function __enable_mise_chpwd{
    if (-not $__mise_pwsh_chpwd){
        $Global:__mise_pwsh_chpwd= $true
        $_mise_chpwd_hook = [EventHandler[System.Management.Automation.LocationChangedEventArgs]] {
            param([object] $source, [System.Management.Automation.LocationChangedEventArgs] $eventArgs)
            end {
                _mise_hook
            }
        };
        $__mise_pwsh_previous_chpwd_function=$ExecutionContext.SessionState.InvokeCommand.LocationChangedAction;

        if ($__mise_original_pwsh_chpwd_function) {
            $ExecutionContext.SessionState.InvokeCommand.LocationChangedAction = [Delegate]::Combine($__mise_pwsh_previous_chpwd_function, $_mise_chpwd_hook)
        }
        else {
            $ExecutionContext.SessionState.InvokeCommand.LocationChangedAction = $_mise_chpwd_hook
        }
    }
}
__enable_mise_chpwd
Remove-Item -ErrorAction SilentlyContinue -Path Function:/__enable_mise_chpwd

function __enable_mise_prompt {
    if (-not $__mise_pwsh_previous_prompt_function){
        $Global:__mise_pwsh_previous_prompt_function=$function:prompt
        function global:prompt {
            if (Test-Path -Path Function:\_mise_hook){
                _mise_hook
            }
            & $__mise_pwsh_previous_prompt_function
        }
    }
}
__enable_mise_prompt
Remove-Item -ErrorAction SilentlyContinue -Path Function:/__enable_mise_prompt

_mise_hook
if (-not $__mise_pwsh_command_not_found){
    $Global:__mise_pwsh_command_not_found= $true
    function __enable_mise_command_not_found {
        $_mise_pwsh_cmd_not_found_hook = [EventHandler[System.Management.Automation.CommandLookupEventArgs]] {
            param([object] $Name, [System.Management.Automation.CommandLookupEventArgs] $eventArgs)
            end {
                if ([Microsoft.PowerShell.PSConsoleReadLine]::GetHistoryItems()[-1].CommandLine -match ([regex]::Escape($Name))) {
                    if (& $env:LOCALAPPDATA\Microsoft\WinGet\Packages\jdx.mise_Microsoft.Winget.Source_8wekyb3d8bbwe\mise\bin\mise.exe hook-not-found -s pwsh -- $Name){
                        _mise_hook
                        if (Get-Command $Name -ErrorAction SilentlyContinue){
                            $EventArgs.Command = Get-Command $Name
                            $EventArgs.StopSearch = $true
                        }
                    }
                }
            }
        }
        $current_command_not_found_function = $ExecutionContext.SessionState.InvokeCommand.CommandNotFoundAction
        if ($current_command_not_found_function) {
            $ExecutionContext.SessionState.InvokeCommand.CommandNotFoundAction = [Delegate]::Combine($current_command_not_found_function, $_mise_pwsh_cmd_not_found_hook)
        }
        else {
            $ExecutionContext.SessionState.InvokeCommand.CommandNotFoundAction = $_mise_pwsh_cmd_not_found_hook
        }
    }
    __enable_mise_command_not_found
    Remove-Item -ErrorAction SilentlyContinue -Path Function:/__enable_mise_command_not_found
}
