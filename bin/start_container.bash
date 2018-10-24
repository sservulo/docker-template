#! /bin/bash

source $(dirname $BASH_SOURCE)/helpers/env_vars.bash

SET_USER=/project/bin/helpers/set_user.bash

GROUP_ID=$(id -g $USER)
USER_ID=$(id -u $USER)

xhost +local:nvidia-docker >> /dev/null

cmd="$DOCKER_RUNNER run \
       -d \
       -h $INNER_HOSTNAME \
       -v ~/.Xauthority:/root/.Xauthority \
       -v $PROJECT_PATH:/project \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=$DISPLAY \
       -e HOST_USER=$USER \
       --privileged
       --tmpfs /tmp \
       --name $CONTAINER_NAME \
       -it $REPOSITORY_NAME/$CONTAINER_NAME:$VERSION \
       sleep infinity"

eval $cmd >> /dev/null

$DOCKER_RUNNER exec -it $CONTAINER_NAME $SET_USER $GROUP_ID $USER_ID $USER


