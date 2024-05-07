# Nextcloud AIO
https://github.com/nextcloud/all-in-one/tree/main

# Nextcloud volume
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