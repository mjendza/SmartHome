## requirements
- push all logs to the one place to improve observability for the solution 


### docker
Push logs via loki driver inside docker-compose
```
x-logging: &loki-logging
  driver: loki
  options: # note: the ip is the ip we will assign later to loki in this file
    loki-url: "http://localhost:3100/loki/api/v1/push"
```
sample serivce 
```
services:
  homeassistant:
    container_name: home-assistant
    restart: always
    image: homeassistant/home-assistant:2022.10.5
    ports:
      - 8123:8123
    environment:
      - TZ=${TZ}
    logging: *loki-logging
```
