#!/bin/bash

# Git Installation Script using pacman
# This script installs Git on Arch Linux systems using pacman

set -e  # Exit on any error

echo "Starting Git installation..."

# Check if running as root or with sudo
if [[ $EUID -eq 0 ]]; then
    echo "Running as root - proceeding with installation"
    PACMAN_CMD="pacman"
else
    echo "Running as regular user - will use sudo"
    PACMAN_CMD="sudo pacman"
fi

# Update package database
echo "Updating package database..."
$PACMAN_CMD -Sy

# Check if git is already installed
if command -v git &> /dev/null; then
    echo "Git is already installed:"
    git --version
    echo "Do you want to reinstall? (y/N)"
    read -r response
    if [[ "$response" != "y" && "$response" != "Y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi
fi

# Install git
echo "Installing Git..."
$PACMAN_CMD -S --noconfirm git

# Verify installation
if command -v git &> /dev/null; then
    echo "Git installation completed successfully!"
    echo "Installed version:"
    git --version
else
    echo "Git installation failed!"
    exit 1
fi

echo "Installation complete!"