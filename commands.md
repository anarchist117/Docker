# Docker
### Build
```
docker build -t <mycontainer> .
```

### Run & Execute
```
docker run  -it --rm <mycontainer> sh
docker exec -it --rm <mycontainer> sh
```

### Log
```
docker logs <mycontainer>
```

# Docker compose
```
docker compose pull
docker compose up -d <service>
```
