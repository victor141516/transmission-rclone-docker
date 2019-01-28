FROM linuxserver/transmission

RUN apk add --no-cache bash python3
RUN curl https://rclone.org/install.sh | sed 's/^    mandb/# /'  | bash
COPY on_download_finish.sh /on_download_finish.sh
COPY remove_until_size.py /remove_until_size.py
RUN chmod +x on_download_finish.sh
RUN sed -i 's/^    "script-torrent-done-enabled": false/    "script-torrent-done-enabled": true/' /defaults/settings.json
RUN sed -i 's/^    "script-torrent-done-filename": ""/    "script-torrent-done-filename": "\/on_download_finish.sh"/' /defaults/settings.json

# docker run --name transclone \
#   -it --rm \
#   -p 19092:9091 \
#   -e RCLONE_REMOTE=Drive:torrent \
#   -v $HOME/.config/rclone:/rclone \
#   transmission-rclone bash
