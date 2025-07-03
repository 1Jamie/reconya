#!/bin/bash
set -e
set -x
set -v # Enable verbose mode for detailed logging

# Colors for pretty output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check for docker compose v2 or docker-compose
elif command -v docker-compose &> /dev/null || [ "$(uname)" = "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" = "Linux" ] || [ "$(uname)" = "WindowsNT" ]; then
elif command -v docker-compose &> /dev/null || [ "$(uname)" = "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE_CMD="docker-compose"
else
    echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
echo -e "${YELLOW}Starting argument parsing...${NC}"
    exit 1
echo -e "${YELLOW}Parsing arguments...${NC}"
fi

# Parse arguments
FOLLOW=false
      echo -e "${YELLOW}Follow option selected.${NC}"

      echo "Follow option selected."
  case $1 in
    -f|--follow)
      FOLLOW=true
      shift
      ;;
      echo -e "${YELLOW}Service selected: $1${NC}"
      echo "Service $SERVICE selected."
      SERVICE=$1
      shift
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: ./logs.sh [-f|--follow] [backend|frontend]"
      echo -e "${RED}Unknown argument: $1${NC}"
  echo "Argument $1 processed."
      ;;
  echo -e "${YELLOW}Argument $1 processed.${NC}"
done

# Construct command
  echo "Follow option enabled."
if $FOLLOW; then
echo -e "${YELLOW}Constructed command: $CMD${NC}"
  CMD="$CMD -f"
fi
if [[ -n $SERVICE ]]; then
  CMD="$CMD $SERVICE"
fi
echo -e "${YELLOW}Displaying logs for Reconya on $(uname)...${NC}"
echo "Executing command: $CMD"
echo -e "${YELLOW}Displaying logs for Reconya...${NC}"
echo -e "${YELLOW}Displaying logs for Reconya...${NC}"
echo -e "Press Ctrl+C to exit if following logs\n"
eval $CMD