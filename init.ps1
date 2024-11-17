# Oh-My-PowerShell Loader
Write-Host "Starting Oh-My-PowerShell..." -ForegroundColor Green
Start-Sleep -Seconds 0.3
Clear-Host  # Clear the screen

# Define the configuration directory
$ConfigDir = "$HOME\.oh-my-powershell"

# Track loaded modules to prevent reloading
$LoadedModules = @{ }

# Optional: Import settings module (loads user preferences and settings)
$SettingsFile = "$ConfigDir\settings\settings.psm1"
if (Test-Path $SettingsFile) {
    Write-Host "Settings loaded from $SettingsFile" -ForegroundColor Green
    Import-Module $SettingsFile
    Start-Sleep -Seconds $LongSleep
    Clear-Host
} else {
    if ($EnableFunctions -eq $true) {
        Write-Host "No settings file found, using defaults." -ForegroundColor Red
    }
    Start-Sleep -Seconds $LongSleep
    Clear-Host
}

# Optional: Check if the settings have loaded
if ($EnableFunctions -eq $true) {
    Write-Host "Functions module should be loaded" -ForegroundColor Blue
}

# Import functions module (loads custom functions)
Write-Host "Importing functions..." -ForegroundColor Blue
Import-Module "$ConfigDir\core\functions.psm1"
Start-Sleep -Seconds 3
if ($EnableFunctions -eq $true) {
    Write-Host "Functions module loaded" -ForegroundColor Green
}

# Optional: Load user functions if present
if ($EnableFunctions -eq $true) {
    $FunctionsFilee = "$ConfigDir\core\functions.psm1"
    if (Test-Path $FunctionsFilee) {
        Write-Host "Functions loaded from $FunctionsFilee" -ForegroundColor Blue
        Import-Module $FunctionsFilee
        Start-Sleep -Seconds $LongSleep
    }
}

# Optional: Load user Alias if present
if ($EnableAliases -eq $true) {
    $AliassFilee = "$ConfigDir\core\aliases.psm1"
    if (Test-Path $AliassFilee) {
        Write-Host "Aliases loaded from $AliassFilee" -ForegroundColor Blue
        Import-Module $AliassFilee
        Start-Sleep -Seconds $LongSleep
    }
}

# Import environment variables only if enabled
if ($EnableEnvironment -eq $true) {
    $EnvironmentFilee = "$ConfigDir\core\environment.psm1"
    if (Test-Path $AliassFilee) {
        Write-Host "Environment variables loaded from $EnvironmentFilee" -ForegroundColor Blue
        Import-Module $EnvironmentFilee
        Start-Sleep -Seconds $LongSleep
    }
}

# Import git and docker modules only if enabled
if ($EnablePlugins -eq $true) {
    # Load git module
    $GitFile = "$ConfigDir\plugins\git.psm1"
    if (Test-Path $GitFile) {
        Write-Host "Loading Git plugin from $GitFile" -ForegroundColor Blue
        if ($QuietWarningNag -eq $true){
            Import-Module $GitFile -WarningAction SilentlyContinue -ErrorAction Continue
        } else {
        Import-Module $GitFile 
        }
        Start-Sleep -Seconds $LongSleep
    } else {
        Write-Host "Git plugin not found." -ForegroundColor Yellow
    }

    # Load docker module
    $DockerFile = "$ConfigDir\plugins\docker.psm1"
    if (Test-Path $DockerFile) {
        Write-Host "Loading Docker plugin from $DockerFile" -ForegroundColor Blue
        if ($QuietWarningNag -eq $true){
            Import-Module $DockerFile -WarningAction SilentlyContinue -ErrorAction Continue
        } else {
            Import-Module $DockerFile 
        }
        Start-Sleep -Seconds $LongSleep
    } else {
        Write-Host "Docker plugin not found." -ForegroundColor Yellow
    }

    Start-Sleep -Seconds $ShortSleep
    Clear-Host
}


# Import themes only if enabled
if ($EnableThemes -eq $true -and (Test-Path "$ConfigDir\themes")) {
    $ThemeFile = "$ConfigDir\themes\$DefaultTheme.psm1"
    if (Test-Path $ThemeFile) {
        Write-Host "Loading theme: $DefaultTheme" -ForegroundColor Blue
        Import-Module $ThemeFile
        Start-Sleep -Seconds 2
        Write-Host "Theme '$DefaultTheme' loaded." -ForegroundColor Cyan
    } else {
        Write-Host "Theme '$DefaultTheme' not found, using basic prompt." -ForegroundColor Yellow
    }
}

# Custom welcome message (displayed last)
Write-Host "Starting Oh-My-PowerShell Complete" -ForegroundColor Green
Start-Sleep -Seconds 0.3
Clear-Host
Write-Host "Welcome to Oh-My-PowerShell!" -ForegroundColor Green

# Call the Quote of the Day function from the functions module
Get-QuoteOfTheDay

# Display the active Python version
Write-Host "Active Python version: $(pyenv version-name)" -ForegroundColor Yellow

# Display the active Node version using the Get-NodeVer function
Write-Host "Active Node version: $(Get-NodeVer)" -ForegroundColor Yellow

# Show debug information
if ($DebugMode -eq $true) {
    Write-Host "Debugging mode enabled" -ForegroundColor Cyan
}
