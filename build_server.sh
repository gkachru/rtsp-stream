#!/bin/bash
source docker.env
docker build -t roverr/rtsp-stream:${DOCKER_VERSION} .