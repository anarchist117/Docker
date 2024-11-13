# Docker

### Build
```
docker build -t <mycontainer> .
docker tag <old_image_name> <new_image_name>
```

### Run & Execute
```
docker run  -it --rm <mycontainer> bash
docker exec -it --rm <mycontainer> bash
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
