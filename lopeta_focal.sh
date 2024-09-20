#!/bin/sh

docker stop `docker ps -a |grep -E "\w+ +\w*focal" | sed 's/ .*//' `
