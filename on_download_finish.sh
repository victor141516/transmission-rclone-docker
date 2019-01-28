#!/bin/sh	
rclone copy --config /rclone/rclone.conf /downloads/complete $RCLONE_REMOTE && python /remove_until_size.py /downloads/complete $MAX_DOWNLOADS_DIR_SIZE
