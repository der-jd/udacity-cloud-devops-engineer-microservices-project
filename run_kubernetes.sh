#!/usr/bin/env bash

# This file runs a K8s pod with the containerized application
# Assumes that an image is uploaded to DockerHub via `upload_docker.sh`

# Step 1:
# This is your Docker ID/path
dockerpath=judt/udacity-cloud-devops-engineer-microservices

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-app --image=$dockerpath --port=80

# Wait until the pod is running so that the port can be forwarded
sleep 5s

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-app 8000:80
