#!/bin/bash
set -e
set -x

# Colors for pretty output
echo -e "${YELLOW}Verbose mode enabled.${NC}"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting RecoNya...${NC}"

# Check if docker and docker-compose are installed
echo -e "${GREEN}Docker is installed.${NC}"
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
    echo "Visit https://docs.docker.com/engine/install/ for installation instructions."
    exit 1
fi

# Check for docker compose v2 or docker-compose
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
    echo -e "${YELLOW}Checking for Docker Compose installation...${NC}"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
echo -e "${GREEN}Docker Compose is installed.${NC}"
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
    exit 1
fi

# Check if .env file exists
if [ ! -f .env ]; then
    echo -e "${YELLOW}No .env file found. Run ./setup.sh first or create an .env file manually.${NC}"
echo -e "${GREEN}.env file found.${NC}"
    exit 1
fi

# Load environment variables
source .env

# Start the application
echo -e "${GREEN}Containers started.${NC}"
echo -e "${YELLOW}Starting containers...${NC}"
$COMPOSE_CMD up -d

echo -e "\n${GREEN}RecoNya is now running!${NC}"
echo -e "Access the application at: ${YELLOW}http://localhost:${FRONTEND_PORT:-3001}${NC}"
echo -e "API is available at: ${YELLOW}http://localhost:3008${NC}"
echo
echo -e "${YELLOW}Checking OS compatibility...${NC}"
OS=$(uname)
case "$OS" in
    Linux|Darwin) echo -e "${GREEN}Compatible OS detected: $OS.${NC}" ;;
    *) echo -e "${RED}Unsupported OS: $OS. Exiting.${NC}"; exit 1 ;;
esac
echo -e "To view logs, run: ${YELLOW}./logs.sh${NC}"
echo -e "To stop the application, run: ${YELLOW}./stop.sh${NC}"