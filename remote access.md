# Configuring remote access
```
systemctl edit docker.service
```
```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
```
```
systemctl daemon-reload
```
```
systemctl restart docker.service
```
```
netstat -lntp | grep dockerd
```

# Documentation
[Configure remote access for Docker daemon](https://docs.docker.com/engine/daemon/remote-access/)
