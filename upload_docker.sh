#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=judt/udacity-cloud-devops-engineer-microservices

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "Login to DockerHub..."
docker login --username judt
docker tag udacity-project $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
