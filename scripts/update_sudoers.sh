#!/bin/bash
set -e


# Define the username and command to be added to the sudoers file
USERNAME="tonystark"
SUDOERS_ENTRY="$USERNAME ALL=(ALL) NOPASSWD: $COMMAND"
# Detect the operating system
OS=$(uname -s)
echo "Detected operating system: $OS"

# Create the sudoers entry
SUDOERS_ENTRY="$USERNAME ALL=(ALL) NOPASSWD: $COMMAND"

# Backup the current sudoers file
sudo cp /etc/sudoers /etc/sudoers.bak
# Add the new entry to the sudoers file if it doesn't already exist
# Add the new entry to the sudoers file if it doesn't already exist
if sudo grep -Fxq "$SUDOERS_ENTRY" /etc/sudoers; then
    echo "Entry already exists in sudoers file."
else
    echo "$SUDOERS_ENTRY" | sudo tee -a /etc/sudoers
    echo "Entry added to sudoers file."
fi
# Additional support for other operating systems
if [ "$OS" = "Darwin" ]; then
    echo "This script currently supports only Linux-based systems."
fi
