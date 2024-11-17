# Custom Git functions for Oh-My-PowerShell

function git-log {
    param (
        [int]$Lines = 10
    )
    git log --oneline -n $Lines
}

function Git-Status {
    git status
}

function Git-Add {
    git add .
}

function Git-Commit {
    param([string]$Message)
    git commit -m $Message
}

function Git-Push {
    git push
}

# Export the functions so they can be used after the module is imported
Export-ModuleMember -Function git-log, Git-Status, Git-Add, Git-Commit, Git-Push

Write-Host "Git functions loaded." -ForegroundColor Green
