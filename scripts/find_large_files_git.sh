#!/bin/bash

# Example
# ../find_large_files.sh "2.days.ago" 200000 | sort -nk3

GIT_CMD="/usr/bin/git"
RANGE=$1
MAX_SIZE=$2

# Iterate over a list of commits
for commit in $(${GIT_CMD} rev-list --all --since={${RANGE}} --pretty=oneline | cut -d' ' -f1); do
  # Iterate over that commit's blobs
  for diffout in $(${GIT_CMD} diff-tree -r -c -M -C --no-commit-id ${commit} | awk '{print $4":"$6}'); do
    blob=$(echo ${diffout} | cut -d':' -f1)
    filename=$(echo ${diffout} | cut -d':' -f2)
    # Skip if this is a file deletion
    if [ "$blob" = "0000000000000000000000000000000000000000" ]; then
       continue
    fi
    # Get the blob size
    blob_size=$(${GIT_CMD} cat-file -s ${blob})
    # Compare it to MAX_SIZE
    if [ "${blob_size}" -gt "${MAX_SIZE}" ]; then
      echo "${commit} ${filename} ${blob_size}"
    fi
  done
done