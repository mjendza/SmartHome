docker network create iot-smart-network
docker-compose -f ./queue/docker-compose.yaml --env-file .env up