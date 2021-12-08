## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

setup:
	# Create the corresponding directory for the python virtual at first
	# mkdir ~/.devops
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	# Deactivate virtualenv with command 'deactivate'
	python3 -m venv ~/.devops
	chmod +x ./resize.sh
	chmod +x ./make_prediction.sh
	chmod +x ./run_docker.sh
	chmod +x ./run_kubernetes.sh
	chmod +x ./upload_docker.sh

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 &&\
    sudo chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
