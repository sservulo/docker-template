#! /bin/bash

set_user() {
  GROUP_ID=$1
  USER_ID=$2
  USER_NAME=$3

  groupadd -g $GROUP_ID $GROUP_ID
  adduser --gecos "" --disabled-password $USER_NAME --uid $USER_ID --gid $GROUP_ID >> /dev/null

  cp /root/.Xauthority /home/$USER_NAME/.Xauthority
  chown $USER_ID:$GROUP_ID /home/$USER_NAME/.Xauthority
  chmod 0600 /home/$USER_NAME/.Xauthority
    
  chmod a+rX /root
  adduser $USER_NAME sudo >> /dev/null
  echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

  sed -ie 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/$USER_NAME/.bashrc

}

set_user $1 $2 $3
