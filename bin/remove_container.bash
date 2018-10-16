#! /bin/bash

source $(dirname $BASH_SOURCE)/helpers/env_vars.bash

$DOCKER_RUNNER stop $CONTAINER_NAME >> /dev/null
$DOCKER_RUNNER rm $CONTAINER_NAME 