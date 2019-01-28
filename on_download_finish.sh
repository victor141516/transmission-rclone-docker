#!/bin/sh	
rclone copy --config /rclone/rclone.conf /downloads/complete $RCLONE_REMOTE && python3 /remove_until_size.py /downloads/complete $MAX_DOWNLOADS_DIR_SIZE
