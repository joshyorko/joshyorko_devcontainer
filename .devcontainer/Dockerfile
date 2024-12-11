FROM mcr.microsoft.com/devcontainers/universal:linux

# Create workspace directory
RUN mkdir -p /workspaces

# Copy first run notice
COPY first-run-notice.txt /tmp/scripts/

# Install essential packages and build tools
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
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
        libxdamage1 libxfixes3 libpango-1.0-0 libgbm1 libgtk-3-0 && \
    sudo apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && apt-get clean -y
RUN git lfs install
# Move first run notice
RUN sudo mkdir -p "/usr/local/etc/vscode-dev-containers/" && \
    sudo mv -f /tmp/scripts/first-run-notice.txt /usr/local/etc/vscode-dev-containers/

# Install cowsay using pip
RUN pip install cowsay

# Configure conda channels
RUN conda config --append channels defaults

# Download and setup zsh configuration
RUN curl -fsSL https://raw.githubusercontent.com/joshyorko/.dotfiles/refs/heads/main/dotfiles/.zshrc -o /home/codespace/.zshrc && \
    sudo chown codespace:codespace /home/codespace/.zshrc && \
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/codespace/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/codespace/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sudo chown -R codespace:codespace /home/codespace/.oh-my-zsh/custom/plugins

CMD ["sleep", "infinity"]