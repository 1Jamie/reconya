#! /bin/bash
echo "Starting frontend development server..."
OS="$(uname)"
if [ "$OS" = "Linux" ] || [ "$OS" = "Darwin" ]; then
  cd ./frontend && npm start
else
  echo "Unsupported operating system: $OS"
  exit 1
fi

cd ./frontend && npm start