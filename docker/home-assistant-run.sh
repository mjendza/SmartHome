cp -r ../home-assistant-configuration ../dist/ha/config

docker-compose -f home-assistant/docker-compose.yaml -f home-assistant/docker-compose.dev.override.yaml --env-file .env.dev up --detach --force-recreate