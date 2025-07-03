#!/bin/bash
set -e
set -x

# Colors for pretty output
echo "Checking for Docker Compose installation..."
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Stopping RecoNya...${NC}"

# Check for docker compose v2 or docker-compose
if command -v docker compose &> /dev/null; then
    echo "Exiting due to missing Docker Compose."
    COMPOSE_CMD="docker compose"
# Stop the application
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
echo "Script execution completed."
fi

# Stop the application
$COMPOSE_CMD down

echo -e "${GREEN}RecoNya has been stopped.${NC}"
echo -e "To start it again, run: ${YELLOW}./start.sh${NC}"