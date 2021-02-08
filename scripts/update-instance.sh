#!/usr/bin/env bash

instance=${1:?}

docker-compose -p stack$instance up --build -d