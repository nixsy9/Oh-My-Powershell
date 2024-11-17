# functions.psm1

# Custom functions

# Write-Log function for normal and extra logging
function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "normal"  # Default is normal logging level
    )
    
    # Check for the EnableLogginExtra flag and log based on the level
    if ($EnableLogginExtra -eq $true -or $Level -eq "normal") {
        switch ($Level) {
            "normal" {
                Write-Host $Message -ForegroundColor White
            }
            "extra" {
                Write-Host "[EXTRA] $Message" -ForegroundColor Cyan
            }
            default {
                Write-Host "[UNKNOWN LEVEL] $Message" -ForegroundColor Red
            }
        }
    }
}

# cdls - Change directory and list contents
function cdls {
    param (
        [string]$Path = "."  # Default to current directory
    )
    Set-Location $Path
    Get-ChildItem
    Write-Log "cdls executed for path: $Path" -Level "normal"  # Log path change
}

# weather - Fetch weather information for a given city
function weather {
    param (
        [string]$City = "London"
    )
    try {
        $weather = Invoke-WebRequest "wttr.in/$City" | Select-String -Pattern ".*"
        Write-Host $weather -ForegroundColor Green
        Write-Log "Weather data for $City fetched successfully." -Level "normal"  # Log success
    }
    catch {
        Write-Log "Failed to fetch weather for $City. Error: $($_.Exception.Message)" -Level "normal"  # Log error
    }
}

function Show-BlingWelcome {
    $blinkColors = @("Magenta", "Cyan", "Green", "Yellow", "Red")
    $i = 0

    # Display the flashy welcome message
    for ($x = 0; $x -lt 10; $x++) {
        Write-Host -NoNewline "Welcome to Oh-My-PowerShell!" -ForegroundColor $blinkColors[$i % $blinkColors.Length]
        $i++
        Start-Sleep -Milliseconds 200
        Clear-Host
    }
    Write-Host "Welcome to Oh-My-PowerShell!" -ForegroundColor White

    # Call and display Quote of the Day
    Get-QuoteOfTheDay
}

function Get-QuoteOfTheDay {
    try {
        # Make the API request
        $quoteApiUrl = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=text&lang=en&text=?"
        $quote = Invoke-RestMethod -Uri $quoteApiUrl -Method Get -Headers @{}
        
        # Display the quote
        Write-Host "`nQuote of the Day: $quote" -ForegroundColor Yellow
        Start-Sleep -Seconds $ShortSleep
    }
    catch {
        Write-Host "Error fetching the quote of the day." -ForegroundColor Red
    }
}

# Get-NodeVer - Get the version of Node.js
function Get-NodeVer {
    # Try to get the Node.js version
    try {
        $ver = node -v
        # Add a space before the node version and output it
        Write-Output "$ver"
        #Write-Log "Node.js version: $ver" -Level "normal"  # Log Node version
    }
    catch {
        # If Node is not installed or command fails, silently handle it
        Write-Host "Node.js is not installed." -ForegroundColor Red
        Write-Log "Node.js is not installed or command failed." -Level "normal"  # Log Node.js error
    }
}

# Exporting functions for use in other modules
Export-ModuleMember -Function *  # Exports all functions in this module
