#!/bin/bash

VIM_USER=${1:-yavin-iv-lite}
IMAGE_NAME=${2:-yavin-iv-lite}

docker build \
  --file nossh-Dockerfile \
  -t ${IMAGE_NAME} \
  --build-arg VIMUSER=y4-lite \
  .

