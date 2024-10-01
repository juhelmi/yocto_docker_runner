ssh-keygen -f '/home/juha/.ssh/known_hosts' -R '[localhost]:2222'
ssh -o StrictHostKeyChecking=no -p 2222 localhost
