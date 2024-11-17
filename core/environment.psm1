# Environment setup for Oh-My-PowerShell

# Set default editor to VS Code
$env:EDITOR = "code"

# Add pyenv for pyenv version management
$env:PYENV_ROOT = "$HOME\.pyenv"
$env:PATH += ";$env:PYENV_ROOT\pyenv-win\bin;$env:PYENV_ROOT\pyenv-win\shims"

# Export environment variables setup
Export-ModuleMember -Variable EDITOR, PYENV_ROOT, PATH

Write-Host "Environment variables set." -ForegroundColor Green
