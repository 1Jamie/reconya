#!/bin/bash
set -e
set -x

# Colors for pretty output
# Check OS compatibility
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${GREEN}Detected Linux OS.${NC}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${GREEN}Detected macOS OS.${NC}"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo -e "${GREEN}Detected Cygwin OS.${NC}"
elif [[ "$OSTYPE" == "msys" ]]; then
    echo -e "${GREEN}Detected MSYS OS.${NC}"
elif [[ "$OSTYPE" == "win32" ]]; then
    echo -e "${RED}Windows is not supported. Please use a compatible OS.${NC}"
    exit 1
else
    echo -e "${RED}Unknown OS. Please use a compatible OS.${NC}"
    exit 1
fi
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting RecoNya...${NC}"

# Check if docker and docker-compose are installed
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
fi
    echo "Visit https://docs.docker.com/engine/install/ for installation instructions."
    exit 1
fi

# Check for docker compose v2 or docker-compose
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
else
    COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
    exit 1
# Check if .env file exists
fi

# Check if .env file exists
if [ ! -f .env ]; then
    echo -e "${YELLOW}No .env file found. Run ./setup.sh first or create an .env file manually.${NC}"
    exit 1
# Load environment variables
fi

# Load environment variables
source .env
$COMPOSE_CMD up -d

# Start the application
echo -e "${YELLOW}Starting containers...${NC}"
$COMPOSE_CMD up -d

echo -e "\n${GREEN}RecoNya is now running!${NC}"
echo -e "Access the application at: ${YELLOW}http://localhost:${FRONTEND_PORT:-3001}${NC}"
echo -e "API is available at: ${YELLOW}http://localhost:3008${NC}"
echo "Script execution completed."
echo
echo -e "To view logs, run: ${YELLOW}./logs.sh${NC}"
echo -e "To stop the application, run: ${YELLOW}./stop.sh${NC}"