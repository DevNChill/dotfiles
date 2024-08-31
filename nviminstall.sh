#!/bin/bash

# Function to install Neovim based on the available package manager
install_nvim() {
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y neovim
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y neovim
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu neovim
    elif command -v zypper &> /dev/null; then
        sudo zypper install -y neovim
    elif command -v yum &> /dev/null; then
        sudo yum install -y neovim
    else
        echo "No supported package manager found. Please install Neovim manually."
        exit 1
    fi
}

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "Neovim not found, installing..."
    install_nvim
else
    echo "Neovim is already installed."
fi

# Get the path to the root of the Git repository
GIT_REPO_PATH=$(git rev-parse --show-toplevel)

# Check if the Git command was successful
if [ $? -ne 0 ]; then
    echo "Error: This script is not being run from within a Git repository."
    exit 1
fi

# Define the nvim config path
CONFIG_PATH="$HOME/.config"

# Check if the nvim directory exists in the Git repository
if [ -d "$GIT_REPO_PATH/nvim" ]; then
    echo "Copying nvim directory from $GIT_REPO_PATH/nvim to $CONFIG_PATH"
    cp -r "$GIT_REPO_PATH/nvim" "$CONFIG_PATH/"
    echo "Configuration copied successfully."
else
    echo "The nvim directory does not exist in the Git repository ($GIT_REPO_PATH)."
    exit 1
fi

