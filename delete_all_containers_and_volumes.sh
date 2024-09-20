docker rm -vf $(docker ps -aq)

# Just images
# docker rmi $(docker images -a)

# Exited containers
# docker rm $(docker ps -a -f status=exited -q)
