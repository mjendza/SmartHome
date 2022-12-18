docker-compose stop

mkdir -p ../../dist
mkdir -p ../../dist/ha
mkdir -p ../../dist/ha/config

cp -a ../../home-assistant-configuration/. ../../dist/ha/config/

docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml --env-file .env.dev up --detach --force-recreate