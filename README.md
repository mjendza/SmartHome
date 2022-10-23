# SmartHome
# TL;DR
A tutorial how to build smart home from scrach
## Decisions log


# Hardware

# Software
## Docker
### run
to run solution use 
```cmd
docker-compose up
```
OR run docker-run.ps1
https://github.com/blaineventurine/home-automation-docker

### dev install
#### list of composes
- home-assistant

use docker-compose `docker-compose.yml` with `DEV` override
```cmd 
docker-compose -f docker-compose.yml -f docker-compose.dev.override.yml --env-file ./config/.env.dev up
```

docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d --force-recreate
docker-compose -f home-assistant/docker-compose.yaml --env-file .env.dev up -d
