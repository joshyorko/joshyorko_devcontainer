# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/universal:focal

# Copy the first-run-notice.txt file
COPY first-run-notice.txt /tmp/scripts/

# Install essential packages, AWS CLI, and PostgreSQL client
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y --no-install-recommends \
        awscli \
        git \
        curl \
        vim \
        sudo \
        postgresql-client && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the 'vscode' user with sudo privileges
RUN sudo adduser --disabled-password --gecos '' vscode && \
    sudo usermod -aG sudo vscode && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers && \
    sudo chown -R vscode:vscode /home/vscode

# Keep the container running
CMD ["sleep", "infinity"]
