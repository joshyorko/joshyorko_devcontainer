FROM mcr.microsoft.com/devcontainers/universal:focal

# Create workspace directory
#RUN mkdir -p /home/workspaces

# Copy first run notice
COPY first-run-notice.txt /tmp/scripts/

# Add setup script
COPY setup-dev-container.sh /tmp/scripts/setup-dev-container.sh
RUN chmod +x /tmp/scripts/setup-dev-container.sh && \
    /tmp/scripts/setup-dev-container.sh

# Move first run notice
RUN sudo mkdir -p "/usr/local/etc/vscode-dev-containers/" && \
    sudo mv -f /tmp/scripts/first-run-notice.txt /usr/local/etc/vscode-dev-containers/

CMD ["sleep", "infinity"]
