#!/bin/sh

docker rmi ` docker image ls | grep -E none | grep -o -E "[ ]([a-f0-9][a-f0-9]+)[ ]" `