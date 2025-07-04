#!/bin/bash
set -e
set -x

# Colors for pretty output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
if command -v docker compose &> /dev/null || [ "$(uname)" = "Darwin" ]; then
echo -e "${YELLOW}Stopping RecoNya...${NC}"

# Check for docker compose v2 or docker-compose
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
echo "Using compose command: $COMPOSE_CMD"
    exit 1
fi

# Stop the application
echo "Script execution completed."
$COMPOSE_CMD down

echo -e "${GREEN}RecoNya has been stopped.${NC}"
echo -e "To start it again, run: ${YELLOW}./start.sh${NC}"