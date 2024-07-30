# Nextcloud AIO
https://hub.docker.com/r/nextcloud/all-in-one

# Nextcloud volume
### Create Folder
```
mkdir /mnt/data/nextcloud_aio_apache
mkdir /mnt/data/nextcloud_aio_database
mkdir /mnt/data/nextcloud_aio_database_dump
mkdir /mnt/data/nextcloud_aio_elasticsearch
mkdir /mnt/data/nextcloud_aio_mastercontainer
mkdir /mnt/data/nextcloud_aio_nextcloud
mkdir /mnt/data/nextcloud_aio_nextcloud_data
mkdir /mnt/data/nextcloud_aio_redis
```
### Create custom volume for store in '/mnt/data/'
```bash
docker volume create --name nextcloud_aio_apache          --opt type=none --opt device=/mnt/data/nextcloud_aio_apache          --opt o=bind
docker volume create --name nextcloud_aio_database        --opt type=none --opt device=/mnt/data/nextcloud_aio_database        --opt o=bind
docker volume create --name nextcloud_aio_database_dump   --opt type=none --opt device=/mnt/data/nextcloud_aio_database_dump   --opt o=bind
docker volume create --name nextcloud_aio_elasticsearch   --opt type=none --opt device=/mnt/data/nextcloud_aio_elasticsearch   --opt o=bind
docker volume create --name nextcloud_aio_mastercontainer --opt type=none --opt device=/mnt/data/nextcloud_aio_mastercontainer --opt o=bind
docker volume create --name nextcloud_aio_nextcloud       --opt type=none --opt device=/mnt/data/nextcloud_aio_nextcloud       --opt o=bind
docker volume create --name nextcloud_aio_nextcloud_data  --opt type=none --opt device=/mnt/data/nextcloud_aio_nextcloud_data  --opt o=bind
docker volume create --name nextcloud_aio_redis           --opt type=none --opt device=/mnt/data/nextcloud_aio_redis           --opt o=bind
```
### Check volume
```bash
docker volume ls
docker volume inspect volume_name
```

# AIO passphrase
```
docker exec nextcloud-aio-mastercontainer grep password /mnt/docker-aio-config/data/configuration.json
```
