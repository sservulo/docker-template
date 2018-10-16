#! /bin/bash

source $(dirname $BASH_SOURCE)/helpers/env_vars.bash

echo "Building image $REPOSITORY_NAME/$CONTAINER_NAME:$VERSION"

$DOCKER_RUNNER build - < Dockerfile.core -t $REPOSITORY_NAME/$CONTAINER_NAME:$VERSION