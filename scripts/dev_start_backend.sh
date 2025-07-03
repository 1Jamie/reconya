#! /bin/bash
echo "Initializing backend development environment..."
OS="$(uname)"
case "$OS" in
    Linux*)     echo "Detected operating system: Linux";;
    Darwin*)    echo "Detected operating system: macOS";;
    CYGWIN*|MINGW*|MSYS*) echo "Detected operating system: Windows";;
    *)          echo "Unknown operating system: $OS";;
esac


cd ./backend && go run cmd/main.go