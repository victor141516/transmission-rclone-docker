# transmission-rclone-docker

Just like [https://hub.docker.com/r/linuxserver/transmission/](https://hub.docker.com/r/linuxserver/transmission/) but with rclone


## How

`$RCLONE_REMOTE` is the full remote rclone path

```
docker run \
   --name transmission-rclone \
   --privileged --restart=always \
   -e RCLONE_REMOTE=Drive:transmission \
   -v $HOME/.config/rclone:/rclone \
   transmission-rclone
```
