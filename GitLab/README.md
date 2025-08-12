# Backup
## Auto
```
gitlab-backup create

/var/opt/gitlab/backups/1234567890_1234_12_12_12.12.12_gitlab_backup.tar
```

## Manual
```
/etc/gitlab/gitlab.rb
/etc/gitlab/gitlab-secrets.json
```

# Restore
```
docker compose exec gitlab bash

export GITLAB_BACKUP_DIR=/var/opt/gitlab/backups
gitlab-backup restore BACKUP=1234567890_1234_12_12_12.12.12

gitlab-ctl reconfigure
gitlab-ctl restart
```

https://about.gitlab.com/
