# Install Docker Engine
https://docs.docker.com/engine/install/ubuntu/

### Install using the `apt` repository

1. Set up Docker's `apt` repository.
   ```
   # Add Docker's official GPG key:
   apt-get update
   apt-get install ca-certificates curl
   install -m 0755 -d /etc/apt/keyrings
   curl -fsSL {{% param "download-url-base" %}}/gpg -o /etc/apt/keyrings/docker.asc
   chmod a+r /etc/apt/keyrings/docker.asc
   
   # Add the repository to Apt sources:
   echo \
     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] {{% param "download-url-base" %}} \
     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   apt-get update
   ```

2. Install the Docker packages.
   ```
   apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

3. Run Docker compose file
   ```
   docker compose up -d

   # Custom configuration files
   docker compsoe up -d -f Custom-File.yml
   ```
