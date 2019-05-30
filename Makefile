help: 
	@cat Makefile

DOCKER_FILE=DockerfileGLN
VERSION_GPU=latest
DOCKER= nvidia-docker

build:
	docker build -t docker_gln/tf-opencv-py3:$(VERSION_GPU) -f $(DOCKER_FILE) .
run:
	$(DOCKER) run --name dockerGLN -it --rm --userns=host --ipc=host -v $(HOME):/documents docker_gln/tf-opencv-py3:$(VERSION_GPU) /bin/bash

bash: 
	build
	run
