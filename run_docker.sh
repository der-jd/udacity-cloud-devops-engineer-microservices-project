#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag udacity-project .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run --rm -it -p 8000:80 --name udacity-app udacity-project
