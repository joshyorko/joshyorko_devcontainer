#!/bin/bash

# Update and upgrade system packages
sudo apt-get update && sudo apt-get upgrade -y

# Install essential packages and tools
sudo apt-get install -y --no-install-recommends \
    awscli \
    git \
    git-lfs \
    curl \
    vim \
    sudo \
    postgresql-client \
    build-essential \
    cmake \
    cppcheck \
    valgrind \
    clang \
    lldb \
    llvm \
    gdb \
    python3-dev \
    vim-doc \
    xtail \
    software-properties-common \
    libsecret-1-dev \
    libnss3 libnspr4 libatk-bridge2.0-0 libatk1.0-0 libx11-6 \
    libpangocairo-1.0-0 libx11-xcb1 libcups2 libxcomposite1 \
    libxdamage1 libxfixes3 libpango-1.0-0 libgbm1 libgtk-3-0

# Install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible && \
    sudo apt-get install -y ansible

# Clean up
sudo apt-get clean && rm -rf /var/lib/apt/lists/* && sudo apt-get autoremove -y

# Install MinIO client (mc)
curl -O https://dl.min.io/client/mc/release/linux-amd64/mc && \
    chmod +x mc && \
    sudo mv mc /usr/local/bin/

# Initialize Git LFS
git lfs install

# Download and setup zsh configuration
curl -fsSL https://raw.githubusercontent.com/joshyorko/.dotfiles/refs/heads/main/dotfiles/.zshrc -o /home/codespace/.zshrc && \
    sudo chown codespace:codespace /home/codespace/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions /home/codespace/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/codespace/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
sudo chown -R codespace:codespace /home/codespace/.oh-my-zsh/custom/plugins

# Install Python cowsay
pip install cowsay

# Configure Conda channels
conda config --append channels defaults

# Print completion message
echo "Setup script executed successfully."
