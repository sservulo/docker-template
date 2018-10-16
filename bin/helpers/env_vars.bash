#! /bin/bash

source $(dirname $BASH_SOURCE)/../config

PROJECT_PATH=$(dirname $BASH_SOURCE)/../..
PROJECT_PATH=$(realpath $PROJECT_PATH)

HOST_USER=$(whoami)
INNER_HOSTNAME=$HOST_USER-docker

if [ "$USE_NVIDIA_DOCKER" = true ]; then
  if [ -z "$(which nvidia-docker)" ]; then 
    echo "nvidia docker not found in the system"
    exit 0
  fi

  DOCKER_RUNNER=nvidia-docker
else
  DOCKER_RUNNER=docker
fi