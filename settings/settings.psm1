# settings.psm1

# User configuration settings

# Supresss Powershell nags about used naming in plugins such as docker and git common warnings are 
# WARNING: The names of some imported commands from the module 'docker' include unapproved verbs that might make them
# less discoverable. To find the commands with unapproved verbs, run the Import-Module command again with the Verbose
# parameter. For a list of approved verbs, type Get-Verb.
$QuietWarningNag = $true

# Enable or disable Plugins
$EnablePlugins = $true

# Enable or disable Aliases
$EnableAliases = $true

# Enable or disable Environment variable setup
$EnableEnvironment = $true

# Enable or disable Custom Functions
$EnableFunctions = $true

# Enable or disable Themes
$EnableThemes = $true

# Set the default theme from bling which is not really finsished minimal and default
$DefaultTheme = "default"

# Enable or disable extra logging (useful for debugging)
$EnableLogginExtra = $false

# Wait imes for script running
$ShortSleep = 1
$LongSleep = 1

# Exporting variables for use in other modules
Export-ModuleMember -Variable *  # Exports all variables in this module
