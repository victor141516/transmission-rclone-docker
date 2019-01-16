FROM linuxserver/transmission

RUN apk add --no-cache fuse bash
RUN curl https://rclone.org/install.sh | sed 's/^    mandb/# /'  | bash
ENTRYPOINT [ "" ]

CMD ["sh", "-c", "mkdir /downloads/complete && rclone mount --allow-other --config /rclone/rclone.conf --daemon $RCLONE_REMOTE /downloads/complete && chown abc:abc /downloads/complete && exec /init"]


# docker run --name transclone --privileged -it --rm -p 19092:9091 -e RCLONE_REMOTE=DriveEdu:transmission -v $HOME/.config/rclone:/rclone transmission-rclone bash
