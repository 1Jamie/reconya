#! /bin/bash
echo "Starting frontend development server..."
OS="$(uname)"
echo "Detected operating system: $OS"


echo "Frontend server started successfully."
cd ./frontend && npm start