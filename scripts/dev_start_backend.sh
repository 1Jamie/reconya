#! /bin/bash
echo "Starting backend development environment setup..."
OS="$(uname)"
echo "Detected operating system: $OS"


echo "Backend server started successfully."
cd ./backend && go run cmd/main.go