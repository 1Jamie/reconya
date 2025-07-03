#!/bin/bash
set -e
set -x

# Colors for pretty output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Stopping RecoNya...${NC}"

if command -v docker compose &> /dev/null || [ "$(uname)" = "Darwin" ]; then
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
fi

# Stop the application
$COMPOSE_CMD down
echo -e "${YELLOW}Detailed log: Docker Compose command used: ${COMPOSE_CMD}${NC}"

echo -e "${GREEN}RecoNya has been stopped.${NC}"
echo -e "To start it again, run: ${YELLOW}./start.sh${NC}"