#! /bin/bash

source $(dirname $BASH_SOURCE)/helpers/env_vars.bash

INIT_BASH=/project/external/bin/helpers/initialize.bash

$DOCKER_RUNNER exec \
    -u $USER \
    -it $CONTAINER_NAME \
    bash -c 'source '$INIT_BASH \

$DOCKER_RUNNER exec \
    -u $USER \
    -it $CONTAINER_NAME \
    bash 
