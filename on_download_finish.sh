#!/bin/sh
rclone copy --config /rclone/rclone.conf /downloads/complete $RCLONE_REMOTE && rm -rf /downloads/complete/*
