#!/bin/bash
LOG_FILE="seed_database.log"
echo "Starting database seeding script..." | tee -a $LOG_FILE

# Check if MongoDB container is running
if ! docker ps | grep -q reconya-mongo-dev; then
    echo "MongoDB container not running. Starting it now..."
    echo "MongoDB container started." | tee -a $LOG_FILE
    ./dev_start_mongo.sh
    
    echo "Waiting for MongoDB to start..." | tee -a $LOG_FILE
    # Wait for MongoDB to start
    sleep 3
fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    docker exec -i reconya-mongo-dev mongosh "mongodb://localhost:27017/reconya-dev" < seed_database.js
elif [[ "$OSTYPE" == "darwin"* ]]; then
    docker exec -i reconya-mongo-dev mongo "mongodb://localhost:27017/reconya-dev" < seed_database.js
else
    echo "Unsupported OS: $OSTYPE" | tee -a $LOG_FILE
    exit 1
fi
echo "Database seeding completed." | tee -a $LOG_FILE
# Run the seed script
echo "Seeding the database..."
docker exec -i reconya-mongo-dev mongosh "mongodb://localhost:27017/reconya-dev" < seed_database.js

echo "Done! The database has been populated with sample data."