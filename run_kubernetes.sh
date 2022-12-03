#!/usr/bin/env bash

# This is your Docker ID/path
dockerPath=dev0th/dev0th-app:latest

# Run the Docker Hub container with kubernetes
kubectl create deployment dev0th-app --image=$dockerPath --port=8080

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward deployment/dev0th-app --address 0.0.0.0 8080:8080