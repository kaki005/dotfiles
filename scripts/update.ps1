winget upgrade --all
Install-Module PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Install-WindowsUpdate -AcceptAll
