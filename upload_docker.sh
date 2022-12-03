#!/usr/bin/env bash

# Create docker path
dockerPath=dev0th/dev0th-app:latest

# Authenticate & tag
echo "Docker ID and Image: $dockerPath"
docker login
docker tag dev0th-app $dockerPath

# Push image to a docker repository
docker push $dockerPath