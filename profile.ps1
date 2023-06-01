# Add the following to your $profile:
#$profile = "path\to\this\profile.ps1"
#. $profile

# Set TLS version
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Setup choco stuff
    Import-Module "${env:ProgramData}/chocolatey/helpers/chocolateyProfile.psm1"

# Setup Azure stuff
    Import-Module AzureAD

# https://github.com/devblackops/Terminal-Icons
    Import-Module Terminal-Icons

# https://starship.rs/config/
    Invoke-Expression (&starship init powershell) # tell powershell to tell starship to run powershell
    $ENV:STARSHIP_CONFIG = "$((ls $profile).DirectoryName)\CurrentMachine\starship.toml"

# PSReadLine
    # https://github.com/PowerShell/PSReadLine
    # https://github.com/PowerShell/PSReadLine/blob/master/PSReadLine/SamplePSReadLineProfile.ps1
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    # F2 to toggle between inline and menu
    Set-PSReadLineOption -PredictionViewStyle InlineView
    # Keybindings ( emac or vi if you like being unable to exit :D )
    Set-PSReadLineOption -EditMode Windows
    # Try with "get-" + up or down arrows; searches only for history with "get-*"
    Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
    # Bash like tab complete menu!
    Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Upgrade all outdated applications
    choco upgrade all

Set-Location (ls $profile).DirectoryName

# ^---------------- Point to your config in source control! ----------------^
