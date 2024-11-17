# Custom Docker functions for Oh-My-PowerShell

function Docker-Status {
    docker info
}

function Docker-Images {
    docker images
}

function Docker-Containers {
    docker ps -a
}

# Export functions so they can be used after importing the module
Export-ModuleMember -Function Docker-Status, Docker-Images, Docker-Containers

Write-Host "Docker functions loaded." -ForegroundColor Green
