
# Activate Bling Welcome and fetch the Quote at startup
Show-BlingWelcome

# Flashy Prompt
function prompt {
    $colors = @("Cyan", "Yellow", "Green", "Magenta", "Red", "White")
    $colorIndex = 0
        # Call and display Quote of the Day
        Get-QuoteOfTheDay

    while ($true) {
        # Flashing text prompt
        Write-Host -NoNewline "[OhMyPS] " -ForegroundColor $colors[$colorIndex]
        Write-Host -NoNewline "$PWD" -ForegroundColor $colors[($colorIndex + 1) % $colors.Length]
        $colorIndex = ($colorIndex + 1) % $colors.Length
        
        # Flashing background effect (using white background)
        Write-Host -NoNewline " > " -ForegroundColor $colors[($colorIndex + 2) % $colors.Length] -BackgroundColor White
        Start-Sleep -Seconds 0.2
        
        Clear-Host
    }
}


#Write-Host "Bling theme loaded!" -ForegroundColor Magenta
