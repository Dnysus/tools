#!/bin/bash

# Linux (Debian-based) Tool Installation Script - x86_64
# Tested on: Debian 13, Ubuntu 22.04+
# Usage: chmod +x install_tools_x86.sh && ./install_tools_x86.sh

set -e  # Exit on any error

echo "=========================================="
echo "Starting Debian-based Linux Setup Script"
echo "Architecture: x86_64"
echo "=========================================="

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt full-upgrade -y

# Install Git
if ! command -v git &> /dev/null; then
  echo "Git not found. Installing..."
  sudo apt install git-all -y
else
  echo "Git is already installed."
fi

# Install curl
if ! command -v curl &> /dev/null; then
  echo "curl not found. Installing..."
  sudo apt update
  sudo apt install curl -y
else
  echo "curl is already installed."
fi

# Install NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
  echo "NVM not found. Installing..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

  # Load NVM into current session
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
  echo "NVM is already installed."
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install Node.js LTS
echo "Installing Node.js LTS..."
nvm install --lts
nvm use --lts

# Install Node.js 20 as well
echo "Installing Node.js 20..."
nvm install 20

# Set LTS as default
nvm alias default 'lts/*'

# Install Serverless Framework globally
if ! command -v serverless &> /dev/null; then
  echo "Serverless Framework not found. Installing..."
  npm install -g serverless
else
  echo "Serverless Framework is already installed."
fi

# Install fastfetch
if ! command -v fastfetch &> /dev/null; then
  echo "fastfetch not found. Installing..."
  sudo apt install fastfetch -y
else
  echo "fastfetch is already installed."
fi

# Install Docker
if ! command -v docker &> /dev/null; then
  echo "Docker not found. Installing..."
  curl -sSL https://get.docker.com | sh

  # Add current user to docker group
  sudo usermod -aG docker "$USER"
  echo "Docker installed. You may need to log out and back in for group changes to take effect."
else
  echo "Docker is already installed."
  # Ensure user is in docker group
  if ! groups "$USER" | grep -q '\bdocker\b'; then
    echo "Adding user to docker group..."
    sudo usermod -aG docker "$USER"
    echo "You may need to log out and back in for group changes to take effect."
  fi
fi

# Install AWS CLI v2 (x86_64)
if ! command -v aws &> /dev/null; then
  echo "AWS CLI not found. Installing..."
  sudo apt install unzip -y
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  # Cleanup
  rm -rf aws awscliv2.zip
else
  echo "AWS CLI is already installed."
fi

echo ""
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "Installed tools:"
echo "  - Git"
echo "  - curl"
echo "  - NVM (Node Version Manager)"
echo "  - Node.js LTS & Node.js 20"
echo "  - Serverless Framework"
echo "  - fastfetch"
echo "  - Docker"
echo "  - AWS CLI v2"
echo ""
echo "IMPORTANT: You may need to:"
echo "  1. Log out and back in for Docker group changes to take effect"
echo "  2. Run 'source ~/.bashrc' to use NVM in the current session"
echo ""
echo "To verify installations, run:"
echo "  git --version"
echo "  node --version"
echo "  npm --version"
echo "  serverless --version"
echo "  fastfetch"
echo "  docker --version"
echo "  aws --version"
echo ""
