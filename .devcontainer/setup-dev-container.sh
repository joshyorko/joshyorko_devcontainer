#!/bin/bash

# Function to show step progress
show_progress() {
    echo "⌛ $1..."
}

# Function to show success
show_success() {
    echo "✅ $1"
}

# Function to handle errors
handle_error() {
    echo "❌ Error: $1"
    exit 1
}

echo "🚀 Starting development container setup..."

show_progress "Updating system packages"
{
    sudo apt-get update >/dev/null 2>&1 && 
    sudo apt-get upgrade -y >/dev/null 2>&1
} || handle_error "Failed to update system packages"
show_success "System packages updated"

show_progress "Installing essential packages"
{
    sudo apt-get install -y --no-install-recommends \
        awscli git git-lfs curl vim sudo postgresql-client \
        build-essential cmake cppcheck valgrind clang lldb llvm \
        gdb python3-dev vim-doc xtail software-properties-common \
        libsecret-1-dev libnss3 libnspr4 libatk-bridge2.0-0 \
        libatk1.0-0 libx11-6 libpangocairo-1.0-0 libx11-xcb1 \
        libcups2 libxcomposite1 libxdamage1 libxfixes3 \
        libpango-1.0-0 libgbm1 libgtk-3-0 >/dev/null 2>&1
} || handle_error "Failed to install essential packages"
show_success "Essential packages installed"

show_progress "Installing Ansible"
{
    sudo apt-add-repository --yes --update ppa:ansible/ansible >/dev/null 2>&1 &&
    sudo apt-get install -y ansible >/dev/null 2>&1
} || handle_error "Failed to install Ansible"
show_success "Ansible installed"

show_progress "Cleaning up apt cache"
{
    sudo apt-get clean >/dev/null 2>&1 &&
    sudo rm -rf /var/lib/apt/lists/* >/dev/null 2>&1
} || true
show_success "Cleanup completed"

show_progress "Installing MinIO client"
{
    curl -s -O https://dl.min.io/client/mc/release/linux-amd64/mc &&
    chmod +x mc &&
    sudo mv mc /usr/local/bin/
} || handle_error "Failed to install MinIO client"
show_success "MinIO client installed"

show_progress "Installing k9s"
{
    curl -sS https://webinstall.dev/k9s | bash >/dev/null 2>&1
} || handle_error "Failed to install k9s"
show_success "k9s installed"

show_progress "Setting up Git LFS"
{
    git lfs install >/dev/null 2>&1
} || handle_error "Failed to setup Git LFS"
show_success "Git LFS configured"

show_progress "Setting up ZSH configuration"
{
    curl -fsSL https://raw.githubusercontent.com/joshyorko/.dotfiles/refs/heads/main/dotfiles/.zshrc -o /home/codespace/.zshrc &&
    sudo chown codespace:codespace /home/codespace/.zshrc &&
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/codespace/.oh-my-zsh/custom/plugins/zsh-autosuggestions >/dev/null 2>&1 &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/codespace/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting >/dev/null 2>&1 &&
    sudo chown -R codespace:codespace /home/codespace/.oh-my-zsh/custom/plugins
} || handle_error "Failed to setup ZSH configuration"
show_success "ZSH configuration completed"

show_progress "Installing Python packages"
{
    pip install cowsay >/dev/null 2>&1
} || handle_error "Failed to install Python packages"
show_success "Python packages installed"

show_progress "Configuring Conda channels"
{
    conda config --append channels defaults >/dev/null 2>&1
} || handle_error "Failed to configure Conda channels"
show_success "Conda channels configured"

echo "✨ Development container setup completed successfully!"
