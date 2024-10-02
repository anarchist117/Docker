# Docker
### Build
```
docker build -t <mycontainer> .
```

### Run
```
docker run -it --rm <mycontainer> /bash
```

### Execute
```
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
