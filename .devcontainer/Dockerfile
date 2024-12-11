# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/universal:focal

# Copy the first-run-notice.txt file
COPY first-run-notice.txt /tmp/scripts/

# Install essential packages, AWS CLI, PostgreSQL client, and build/debug tools
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y --no-install-recommends \
        awscli \
        git \
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
        libxdamage1 libxfixes3 libpango-1.0-0 libgbm1 libgtk-3-0 && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && apt-get clean -y

# Move the first run notice to the correct spot
RUN mkdir -p "/usr/local/etc/vscode-dev-containers/" && \
    mv -f /tmp/scripts/first-run-notice.txt /usr/local/etc/vscode-dev-containers/

# Install cowsay using pip
RUN pip install cowsay

# Configure conda channels
RUN conda config --append channels defaults

# Create the 'vscode' user with sudo privileges
RUN sudo adduser --disabled-password --gecos '' vscode && \
    sudo usermod -aG sudo vscode && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers && \
    sudo chown -R vscode:vscode /home/vscode

# Download and copy .zshrc to the codespace user's home directory
RUN curl -fsSL https://raw.githubusercontent.com/joshyorko/.dotfiles/refs/heads/main/dotfiles/.zshrc -o /home/codespace/.zshrc && \
    sudo chown codespace:codespace /home/codespace/.zshrc && \
    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/codespace/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    # Install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/codespace/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sudo chown -R codespace:codespace /home/codespace/.oh-my-zsh/custom/plugins


# Keep the container running
CMD ["sleep", "infinity"]