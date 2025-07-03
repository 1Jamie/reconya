#!/bin/bash
LOG_FILE="/var/log/update_sudoers.log"
OS_TYPE=$(uname -s)


# Define the username and command to be added to the sudoers file
USERNAME="tonystark"
COMMAND="/usr/bin/nmap"
echo "Starting update_sudoers script" | tee -a $LOG_FILE
echo "Operating System: $OS_TYPE" | tee -a $LOG_FILE


# Create the sudoers entry
SUDOERS_ENTRY="$USERNAME ALL=(ALL) NOPASSWD: $COMMAND"
echo "Sudoers entry to be added: $SUDOERS_ENTRY" | tee -a $LOG_FILE


# Backup the current sudoers file
sudo cp /etc/sudoers /etc/sudoers.bak

# Add the new entry to the sudoers file if it doesn't already exist
if sudo grep -Fxq "$SUDOERS_ENTRY" /etc/sudoers; then
    echo "Entry already exists in sudoers file."
else
    echo "$SUDOERS_ENTRY" | sudo tee -a /etc/sudoers
    echo "Entry added to sudoers file."
fi
echo "Update_sudoers script completed" | tee -a $LOG_FILE
