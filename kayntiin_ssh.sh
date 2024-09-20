#!/bin/bash

UBUNTU_VERSION=22

# docker run -p 2222:22 -v /home/juha/.ssh:/home/juha/.ssh -v /data/yocto_docker/mount_home:/home/juha -it ubuntu_focal_ssh
#docker run -d -p 2222:22 -v /data/yocto_docker/mount_home:/home/juha ubuntu_focal_ssh

COLUMNS=80
LINES=25
TERM=stty
docker run --pid=host -e DISPLAY=$DISPLAY --rm    -p 2222:22 -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/juha/.ssh:/home/juha/.ssh -v /data/yocto_docker/mount_home:/home/juha -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM ubuntu_${UBUNTU_VERSION}_focal_ssh
# docker run --pid=host -e DISPLAY=$DISPLAY --rm -d -p 2222:22 -v /data/yocto_docker/mount_home:/home/juha -v /tmp/.X11-unix:/tmp/.X11-unix -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM ubuntu_${UBUNTU_VERSION}_focal_ssh
