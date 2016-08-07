#!/bin/bash

## Install Docker on Fedora

# Add the Docker yum repo;
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/fedora/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# Install the Docker Engine
dnf install -y docker-engine

# Enable the Docker service;
systemctl enable docker.service

# Start the Docker service;
systemctl start docker

# Show Docker version;
docker version

# Download en start the Docker "Hello world" container
docker run hello-world

# Stop and remove ContainerImage;
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Remove image;
docker rmi $(docker images -q)
