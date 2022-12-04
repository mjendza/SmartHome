# SmartHome
# TL;DR
A tutorial how to build smart home from scratch. Still PoC. 
## Decisions log

| Decision           | Rationale                                                                          | Status                                             |
|--------------------|------------------------------------------------------------------------------------|----------------------------------------------------|
| big-picture        | Want to track vision of the system with big picture.                               | TBD                                                |
| hosting/deployment | Want to host applications with docker - defined with docker compose.               | (PR3)[https://github.com/mjendza/SmartHome/pull/3] |
| development        | Verify development first. Need to use github actions to check it can use solution. | (PR4)[https://github.com/mjendza/SmartHome/pull/4] |

# requirements
- SSH development with VS Code
- dev environment on Azure VM
- want to make SSO for all applications

# Hardware
# Software
## docker
- one shared network for all composes
- most of the volumes are as local folders (TBD: need to check what about PROD env)
- single environment file for all composes
![Big Picture](doc/big-picture/SmartHome-Big_Picture.png)

### run


#### list of composes
##### home-assistant
use docker-compose `docker-compose.yml` with `DEV` override - with sh command we copy the HA configuration to the destination folder
```cmd 
sh home-assistant-run.sh 
```
##### queue
```cmd
docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d --force-recreate
```
##### observability
```cmd
docker-compose -f observability/docker-compose.yaml --env-file .env.dev up -d --force-recreate
```
