#!/bin/sh

UBUNTU_VERSION=22

echo Ajetaan: docker build --file dockerfile_focal --tag ubuntu_${UBUNTU_VERSION}_focal_ssh .
docker build --file dockerfile_focal_ssh --tag ubuntu_${UBUNTU_VERSION}_focal_ssh .
