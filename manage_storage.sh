#!/bin/bash

MAX_SIZE=32000000000  # 32GB in bytes
FOLDER="recordings"

while true; do
    # Get current folder size
    current_size=$(du -sb "$FOLDER" | cut -f1)
    
    # Delete oldest files if size exceeds limit
    while [ "$current_size" -gt "$MAX_SIZE" ]; do
        oldest_file=$(ls -t "$FOLDER" | tail -n 1)
        rm "$FOLDER/$oldest_file"
        current_size=$(du -sb "$FOLDER" | cut -f1)
    done
    
    # Wait for a minute before checking again
    sleep 60
done
