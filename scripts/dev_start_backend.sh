#! /bin/bash
echo "Starting backend development environment setup..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Detected Linux OS."
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS OS."
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Detected Cygwin OS."
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Detected MSYS/MinGW OS."
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Detected Windows OS."
else
    echo "Unknown OS. Please ensure compatibility."
fi



echo "Backend development environment started successfully."
cd ./backend && go run cmd/main.go