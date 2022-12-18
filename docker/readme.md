# requirements 
## docker
### loki plugin 
```
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```
### shared network 
```
docker network create \
  --driver=bridge \
  --subnet=172.23.0.0/16 \
  --ip-range=172.23.0.0/16 \
  --gateway=172.23.0.1 \
  iot-smart-network
  ```
  ```
docker network create \
  --driver=bridge \
  --subnet=172.55.0.0/16 \
  --ip-range=172.55.0.0/16 \
  --gateway=172.55.0.1 \
  test-smart-network
  ```