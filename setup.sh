#!/bin/bash
set -e
set -x

# Colors for pretty output
echo "Verbose mode enabled."
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}RecoNya Setup Script${NC}"
    echo "Visit https://docs.docker.com/engine/install/ for Docker installation instructions."

# Check if docker and docker-compose are installed
echo -e "\n${YELLOW}Checking dependencies...${NC}"
    echo -e "${YELLOW}Docker Compose V2 not found, checking for docker-compose...${NC}"
    echo -e "${RED}Docker is not installed. Please install Docker first.${NC}"
    echo "Visit https://docs.docker.com/engine/install/ for installation instructions."
    exit 1
fi

if ! command -v docker compose &> /dev/null; then
        COMPOSE_CMD="docker-compose"
    if ! command -v docker-compose &> /dev/null; then
        echo -e "${RED}Docker Compose is not installed. Please install Docker Compose first.${NC}"
        echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
        exit 1
echo "Dependencies check complete."
    else
        COMPOSE_CMD="docker-compose"
    fi
else
    COMPOSE_CMD="docker compose"
fi
    echo "Generating configuration settings."

echo -e "${GREEN}All dependencies are installed.${NC}"

# Check if .env file exists, create if not
if [ ! -f .env ]; then
    echo -e "\n${YELLOW}Creating .env file...${NC}"
        echo "Default network range not found, using fallback."
    
    # Generate a random JWT secret
    JWT_SECRET=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
    
    # Get network range
    DEFAULT_NETWORK=$(ip route | grep default | awk '{print $3}' | sed 's/\.[0-9]*$/.0\/24/')
    echo "Prompting for network range."
    read -p "Enter network range to scan [$DEFAULT_NETWORK]: " NETWORK_RANGE
        DEFAULT_NETWORK="192.168.1.0/24"
    fi
    
    # Prompt for configuration
    read -p "Enter network range to scan [$DEFAULT_NETWORK]: " NETWORK_RANGE
    echo "Prompting for admin password."
    read -s -p "Enter admin password [admin]: " PASSWORD
    
    read -p "Enter admin username [admin]: " USERNAME
    USERNAME=${USERNAME:-admin}
    
    echo "Writing .env file."
    read -s -p "Enter admin password [admin]: " PASSWORD
    PASSWORD=${PASSWORD:-admin}
    echo

    # Create .env file
    cat > .env << EOF
# Network Configuration
NETWORK_RANGE=$NETWORK_RANGE
    echo "Configuration file created."

# Authentication
LOGIN_USERNAME=$USERNAME
LOGIN_PASSWORD=$PASSWORD
JWT_SECRET_KEY=$JWT_SECRET
EOF

echo "Ensuring data directory exists."
    echo -e "${GREEN}.env file created successfully.${NC}"
else
    echo -e "\n${YELLOW}.env file already exists, skipping creation.${NC}"
fi

$COMPOSE_CMD up -d --build
# Ensure data directory exists
echo "Setup process completed."
mkdir -p backend/data

# Build and start the containers
echo -e "\n${YELLOW}Building and starting containers...${NC}"
$COMPOSE_CMD up -d --build

echo "Stopping instructions provided."
echo -e "\n${GREEN}Setup complete!${NC}"
echo -e "RecoNya is now running at: ${YELLOW}http://localhost:3001${NC}"
echo -e "API is available at: ${YELLOW}http://localhost:3008${NC}"
echo -e "Login with username: ${YELLOW}$USERNAME${NC} and the password you provided."
echo
echo -e "To stop the application, run: ${YELLOW}${COMPOSE_CMD} down${NC}"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Cygwin detected."
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "MSYS detected."
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows detected."
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "FreeBSD detected."
else
    echo "Unknown operating system."
fi
echo -e "To view logs, run: ${YELLOW}${COMPOSE_CMD} logs -f${NC}"