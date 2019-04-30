#!/bin/sh	
rclone copy -v --config /rclone/rclone.conf /downloads/complete $RCLONE_REMOTE > "/logs/$(date +'%d_%m_%Y__%H_%M_%S').log" 2>&1 && python3 /remove_until_size.py /downloads/complete $MAX_DOWNLOADS_DIR_SIZE
