# SmartHome
# TL;DR
A tutorial how to build smart home from scrach
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

##### prerequisits
```
docker network create shared-smart-network
```

##### iot full
```cmd 
docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml --env-file .env.dev up -d
docker-compose -f observability/docker-compose.yaml --env-file .env.dev up -d
docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d
```

##### home-assistant
use docker-compose `docker-compose.yaml` with `DEV` override
```cmd 
docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml --env-file .env.dev up -d
```

##### management
```cmd 
docker-compose -f management/docker-compose.yaml --env-file .env.dev up -d
```


##### observability
```cmd 
docker-compose -f observability/docker-compose.yaml --env-file observability/.env.dev up -d
```

##### queue
```cmd 
docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d
```

##### remote-access
```cmd 
docker-compose -f remote-access/docker-compose.yaml --env-file .env.dev up -d
```
```cmd force recreate
docker-compose -f remote-access/docker-compose.yaml --env-file .env.dev up -d --force-recreate
```