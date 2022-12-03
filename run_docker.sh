#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build -t dev0th-app .

# List docker images
docker image ls | grep dev0th-app

# Start a docker container to run the app
docker run --name=dev0th-container --rm -p 8080:8080 -d dev0th-app