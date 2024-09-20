#!/bin/sh

if [ -z "$UBUNTU_VERSION" ]; then
  UBUNTU_VERSION=22
fi

# Add "DOCKER_BUILDKIT=0 " for docker build to show immediate output
echo Ajetaan: docker build --file dockerfile_${UBUNTU_VERSION}_focal --tag ubuntu_${UBUNTU_VERSION}_focal_ssh .
DOCKER_BUILDKIT=0 docker build --file dockerfile_${UBUNTU_VERSION}_focal_ssh --tag ubuntu_${UBUNTU_VERSION}_focal_ssh .
