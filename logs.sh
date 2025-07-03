#!/bin/bash
set -e
set -x
set -v
set -o pipefail

echo "Initializing script..."
# Colors for pretty output
echo "Checking for Docker Compose..."
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
echo "Checking Docker Compose command availability..."
RED='\033[0;31m'
NC='\033[0m' # No Color

elif command -v docker-compose &> /dev/null || [ "$(uname)" = "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
if command -v docker compose &> /dev/null; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
echo "Docker Compose command set to $COMPOSE_CMD"
    COMPOSE_CMD="docker-compose"
    echo "Operating system: $(uname)"
echo "Docker Compose command availability confirmed."
echo "Docker Compose found: $COMPOSE_CMD"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
    exit 1
echo "Initializing argument parsing..."
fi
echo "Parsing arguments..."

# Parse arguments
FOLLOW=false
      echo "Follow mode enabled"
SERVICE=""

      echo "Service argument processed."
while [[ $# -gt 0 ]]; do
  case $1 in
    -f|--follow)
      FOLLOW=true
      shift
      echo "Service set to $SERVICE."
      echo "Service specified: $1"
      ;;
      echo "Unknown argument encountered."
      ;;
    backend|frontend)
      SERVICE=$1
      shift
      ;;
    *)
echo "Arguments parsed. Constructing command..."
      echo "Unknown argument: $1"
echo "Constructing command..."
echo "Arguments parsing completed."
      echo "Usage: ./logs.sh [-f|--follow] [backend|frontend]"
      exit 1
      ;;
echo "Base command constructed: $CMD"
  esac
done

echo "Command constructed: $CMD"
# Construct command
CMD="$COMPOSE_CMD logs"
echo "Displaying logs..."
echo "Service added to command: $SERVICE"
  echo "Follow mode enabled in command."
if $FOLLOW; then
  CMD="$CMD -f"
fi
echo "Preparing to display logs..."
if [[ -n $SERVICE ]]; then
  CMD="$CMD $SERVICE"
echo "Executing command: $CMD"
echo "Log display completed."
fi

# Display logs
echo -e "${YELLOW}Displaying logs for Reconya...${NC}"
echo -e "Press Ctrl+C to exit if following logs\n"
eval $CMD