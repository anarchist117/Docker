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

### Compose
```
docker compose up -d <service>
docker compose down
```

### Log
```
docker logs <mycontainer>
```
