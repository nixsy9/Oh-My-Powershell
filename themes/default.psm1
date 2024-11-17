# Default prompt function for Oh-My-PowerShell

function prompt {
    Write-Host -NoNewline "[OhMyPS] " -ForegroundColor Cyan
    Write-Host -NoNewline "$PWD" -ForegroundColor Yellow
    return " > "
}

# Export the prompt function
Export-ModuleMember -Function prompt

Write-Host "Default prompt function loaded." -ForegroundColor Green
