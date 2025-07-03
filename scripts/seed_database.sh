#!/bin/bash
LOG_FILE="seed_database.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting database seeding script..."


# Check if MongoDB container is running
if ! docker ps | grep -q reconya-mongo-dev; then
    echo "MongoDB container not running. Starting it now..."
    ./dev_start_mongo.sh
    
    # Wait for MongoDB to start
    echo "MongoDB container started."
    sleep 3
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    docker exec -i reconya-mongo-dev mongosh "mongodb://localhost:27017/reconya-dev" < seed_database.js
elif [[ "$OSTYPE" == "darwin"* ]]; then
    docker exec -i reconya-mongo-dev mongo "mongodb://localhost:27017/reconya-dev" < seed_database.js
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi
echo "Seeding the database..."
echo "Database seeding script completed."
docker exec -i reconya-mongo-dev mongosh "mongodb://localhost:27017/reconya-dev" < seed_database.js

echo "Done! The database has been populated with sample data."