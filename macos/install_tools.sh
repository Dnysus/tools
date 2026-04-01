#!/bin/bash

# Install Xcode Command Line Tools if not already installed
if ! xcode-select -p &> /dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install

  # Wait until the Xcode Command Line Tools are installed
  until xcode-select -p &> /dev/null; do
    echo "Waiting for Xcode Command Line Tools to install..."
    sleep 5
  done

  echo "Xcode Command Line Tools installed."
else
  echo "Xcode Command Line Tools are already installed."
fi

# Checks if Homebrew is installed, installs if not present
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Add Homebrew to PATH
# shellcheck disable=SC2016
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Git
if ! command -v git &> /dev/null; then
  echo "Git not found. Installing..."
  brew install git
else
  echo "Git is already installed."
fi

# Install Java LTS (Java 22)
if ! java -version 2>&1 | grep -q "22"; then
  echo "Java 22 not found. Installing..."
  brew install openjdk@22
  sudo ln -sfn /opt/homebrew/opt/openjdk@22/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-22.jdk
  # shellcheck disable=SC2016
  echo 'export PATH="/opt/homebrew/opt/openjdk@22/bin:$PATH"' >> ~/.zprofile
  echo 'export CPPFLAGS="-I/opt/homebrew/opt/openjdk@22/include"' >> ~/.zprofile
  # shellcheck disable=SC1090
  source ~/.zprofile
else
  echo "Java 22 is already installed."
fi

# Install AWS CLI
if ! command -v aws &> /dev/null; then
  echo "AWS CLI not found. Installing..."
  brew install awscli
else
  echo "AWS CLI is already installed."
fi

# Install Python 3.10
if ! python3.10 --version &> /dev/null; then
  echo "Python 3.10 not found. Installing..."
  brew install python@3.10
  # shellcheck disable=SC2016
  echo 'export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"' >> ~/.zprofile
  # shellcheck disable=SC1090
  source ~/.zprofile
else
  echo "Python 3.10 is already installed."
fi

# Install Node.js
if ! command -v node &> /dev/null; then
  echo "Node.js not found. Installing..."
  brew install node
else
  echo "Node.js is already installed."
fi

# Install Gemini CLI
if ! command -v gemini &> /dev/null; then
  echo "Gemini CLI not found. Installing..."
  brew install gemini-cli
else
  echo "Gemini CLI is already installed."
fi

# Install Google Cloud CLI
if ! command -v gcloud &> /dev/null; then
  echo "Google Cloud CLI not found. Installing..."
  brew install --cask gcloud-cli
else
  echo "Google Cloud CLI is already installed."
fi

# Install Terraform
if ! command -v terraform &> /dev/null; then
  echo "Terraform not found. Installing..."
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
else
  echo "Terraform is already installed."
fi

echo "All installations completed."