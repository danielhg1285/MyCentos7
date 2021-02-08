#!/usr/bin/env bash

image_name=${1:?}
file=${2:?}

image_prefix=$(cut -d ':' -f 1 <<< $image_name )
image_version=$(cut -d ':' -f 2 <<< $image_name )

echo "image is $image_name"
if ! docker image ls | grep -q $image_prefix | grep -q $image_version ; then
  docker pull $image_name
fi

docker image save $image_name -o $file.tar

env GZIP=-9 tar cvzf $file.tar.gz $file.tar