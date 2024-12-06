# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/universal:focal

# Install essential packages and AWS CLI
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y --no-install-recommends \
        awscli \
        git \
        curl \
        vim \
        sudo && \
    # Clean up to reduce image size
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the 'vscode' user with sudo privileges
RUN sudo adduser --disabled-password --gecos '' vscode && \
    sudo usermod -aG sudo vscode && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers

# Switch to 'vscode' user
USER vscode

# Set the home directory
ENV HOME=/home/vscode

# Set the default shell to bash
ENV SHELL=/bin/bash

# Optional: Install additional tools or dependencies here
# Example:
# RUN sudo apt-get update && sudo apt-get install -y <package-name>

# Keep the container running
CMD ["sleep", "infinity"]
