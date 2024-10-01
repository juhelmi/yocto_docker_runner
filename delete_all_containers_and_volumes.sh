docker rm -vf $(docker ps -aq)

# Remove unused data
# docker system prune

# Just images
# docker rmi $(docker images -a)

# Exited containers
# docker rm $(docker ps -a -f status=exited -q)
