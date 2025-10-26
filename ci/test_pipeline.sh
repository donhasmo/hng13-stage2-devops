#!/bin/bash
set -e

echo "Starting services..."
docker-compose up -d
sleep 5

echo "Verifying Blue..."
curl -I http://localhost:8080/version | grep "X-App-Pool: blue"

echo "Starting chaos..."
curl -X POST "http://localhost:8081/chaos/start?mode=error"
sleep 5

echo "Verifying Green failover..."
curl -I http://localhost:8080/version | grep "X-App-Pool: green"

echo "Test passed — failover working"
docker-compose down -v
