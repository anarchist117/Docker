# Nextcloud AIO
https://hub.docker.com/r/nextcloud/all-in-one

# Nextcloud AIO Interface
https://nextcloud.domain.com:8080

https://nextcloud.domain.com:8443 (if Port 80 TCP opened)


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
docker volume create --name nextcloud_aio_apache          --opt device=/mnt/data/nextcloud_aio_apache          --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_database        --opt device=/mnt/data/nextcloud_aio_database        --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_database_dump   --opt device=/mnt/data/nextcloud_aio_database_dump   --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_elasticsearch   --opt device=/mnt/data/nextcloud_aio_elasticsearch   --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_mastercontainer --opt device=/mnt/data/nextcloud_aio_mastercontainer --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_nextcloud       --opt device=/mnt/data/nextcloud_aio_nextcloud       --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_nextcloud_data  --opt device=/mnt/data/nextcloud_aio_nextcloud_data  --opt type=none --opt o=bind
docker volume create --name nextcloud_aio_redis           --opt device=/mnt/data/nextcloud_aio_redis           --opt type=none --opt o=bind
```
### Check volume
```bash
docker volume ls
docker volume inspect volume_name
```

# Security & setup warnings
```
docker exec --user www-data nextcloud-aio-nextcloud php occ config:system:set default_phone_region --value="US"
docker exec --user www-data nextcloud-aio-nextcloud php occ maintenance:repair --include-expensive
```

# AIO passphrase
```
docker exec nextcloud-aio-mastercontainer grep password /mnt/docker-aio-config/data/configuration.json
```

# Change backup location
```
docker exec nextcloud-aio-mastercontainer rm /mnt/docker-aio-config/data/borg.config
```

# Reset 2FA
Install [Two-Factor Admin Support](https://apps.nextcloud.com/apps/twofactor_admin)
```
docker exec --user www-data nextcloud-aio-nextcloud php occ twofactorauth:admin:generate-code username
```

# Collabora
Nextcloud AIO => Additional Collabora options
```
--o:security.seccomp=false
```
