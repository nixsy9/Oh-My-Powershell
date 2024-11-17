# Custom aliases module for Oh-My-PowerShell

# Aliases for commonly used commands
Set-Alias ll    'Get-ChildItem'
Set-Alias lsa   'Get-ChildItem -Force'
Set-Alias gits  'git status'
Set-Alias gitc  'git commit'
Set-Alias gitl  'git log'
Set-Alias gita  'git add'
Set-Alias gitp  'git push'
Set-Alias gitlg 'git log --oneline --graph --decorate --all'

# Example: Alias to open VS Code from the command line
Set-Alias code 'C:\Program Files\Microsoft VS Code\Code.exe'

# Export aliases so they can be used after importing the module
Export-ModuleMember -Alias ll, lsa, gs, gitc, gl, ga, gp, glg, code

Write-Host "Aliases loaded." -ForegroundColor Green
