# Install the Container feature
Install-WindowsFeature Containers

# Create new Docker directory in "C:\Program Files\"
New-Item -Type Directory -Path ‘C:\Program Files\docker\’

# Download the Docker Engine and Docker Client
Invoke-WebRequest https://aka.ms/tp5/b/dockerd -OutFile $env:ProgramFiles\docker\dockerd.exe
Invoke-WebRequest https://aka.ms/tp5/b/docker -OutFile $env:ProgramFiles\docker\docker.exe

# Set Docker environment variables
[Environment]::SetEnvironmentVariable(“Path”, $env:Path + “;C:\Program Files\Docker”, [EnvironmentVariableTarget]::Machine)

# Register new Docker service
dockerd.exe --register-service

# Start the Docker service
Start-Service docker

# Download the Windows image (download size is 9.4GB)
Install-PackageProvider ContainerImage -Force
Install-ContainerImage -Name WindowsServerCore

# Restart Docker service
Restart-Service docker

# Check if docker is running okay
docker version
docker info

# Show images
docker images

# Rename image version "windowservercore" to latest
docker tag windowsservercore:10.0.14300.1000 windowsservercore:latest
