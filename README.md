## 👋 Welcome to lighttpd 🚀  

lighttpd README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update lighttpd
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/lighttpd/lighttpd/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/lighttpd/rootfs"
git clone "https://github.com/dockermgr/lighttpd" "$HOME/.local/share/CasjaysDev/dockermgr/lighttpd"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/lighttpd/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-lighttpd-latest \
--hostname lighttpd \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/lighttpd:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/lighttpd
    container_name: casjaysdevdocker-lighttpd
    environment:
      - TZ=America/New_York
      - HOSTNAME=lighttpd
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/lighttpd/lighttpd/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/lighttpd/lighttpd/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/lighttpd
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/lighttpd" "$HOME/Projects/github/casjaysdevdocker/lighttpd"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/lighttpd"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
