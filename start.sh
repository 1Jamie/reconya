#!/bin/bash
set -e
set -x

# Colors for pretty output
echo "Checking for Docker installation..."
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting RecoNya...${NC}"
echo "Docker is installed."

# Check if docker and docker-compose are installed
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
    echo "Visit https://docs.docker.com/engine/install/ for installation instructions."
    exit 1
    echo "Checking for Docker Compose installation..."
fi

# Check for docker compose v2 or docker-compose
echo "Docker Compose is installed."
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
echo ".env file found."
    echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
    exit 1
echo "Environment variables loaded."
fi

echo "Containers started."
# Check if .env file exists
if [ ! -f .env ]; then
    echo -e "${YELLOW}No .env file found. Run ./setup.sh first or create an .env file manually.${NC}"
    exit 1
fi

# Load environment variables
echo "Script execution completed."

# Add support for more operating systems
OS=$(uname)
case "$OS" in
    "Linux"|"Darwin"|"FreeBSD")
        echo "Running on supported OS: $OS"
        ;;
    *)
        echo -e "${RED}Unsupported operating system: $OS. Exiting.${NC}"
        exit 1
        ;;
esac
source .env

# Start the application
echo -e "${YELLOW}Starting containers...${NC}"
$COMPOSE_CMD up -d

echo -e "\n${GREEN}RecoNya is now running!${NC}"
echo -e "Access the application at: ${YELLOW}http://localhost:${FRONTEND_PORT:-3001}${NC}"
echo -e "API is available at: ${YELLOW}http://localhost:3008${NC}"
echo
echo -e "To view logs, run: ${YELLOW}./logs.sh${NC}"
echo -e "To stop the application, run: ${YELLOW}./stop.sh${NC}"