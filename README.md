[![CircleCI](https://circleci.com/gh/der-jd/udacity-cloud-devops-engineer-microservices-project/tree/main.svg?style=shield)](https://circleci.com/gh/der-jd/udacity-cloud-devops-engineer-microservices-project/tree/main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Run `make setup`
* Activate virtual environment with `source ~/.devops/bin/activate` (deactivate with `deactivate`)
* When using AWS EC2 instance, resize storage volume: Run `resize.sh`
* Install `Docker` if necessary
* Install `kubectl` on Linux (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
    * curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    * sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
* Install `minikube` on Linux
    * curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    * sudo install minikube-linux-amd64 /usr/local/bin/minikube
* Run `make install` to install the necessary dependencies
* Run `sudo make install_hadolint` to install hadolint on Linux

## Using the app

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:
    * Run `./run_docker.sh` if not already done to build the image
    * Run `./upload_docker.sh` to upload the image to DockerHub
    * Start minikube cluster via `minikube start`
    * Run `./run_kubernetes.sh`
    * Delete pods after use via `./delete_kubernetes.sh`
    * Delete minikube cluster via `minikube delete`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Get housing prices

* Run `./make_prediction.sh` to get a predicted housing price via a new terminal when in another terminal the application is running (locally, via Docker or via K8s)

## Files

* .circleci/config.yml
    * Config file for CI pipeline of circleci
* model_data/
    * Data for the housing price model
* output_txt_files/
    * Example for the log output of the running application via Docker and K8s after making an API call
* .gitignore
    * Well....ignore it ;-)
* app.py
    *  Python application for predicting housing prices in Boston
* delete_kubernetes.sh
    *  Delete created K8s pod
* Dockerfile
    *  Description of the image for the containerized application
* make_prediction.sh
    * Run to make an API call to the web application
* Makefile
    * Commands to setup the environment, install dependencies and lint files
* README.md
    * recursion...^^
* requirements.txt
    * Python package dependencies
* resize.sh
    * Resize the AWS EC2 storage volume to 20 GB
* run_docker.sh
    * Run the application via Docker container
* run_kubernetes.sh
    * Run the application via a K8s pod
* upload_docker.sh
    * Upload the Docker image to DockerHub repository
