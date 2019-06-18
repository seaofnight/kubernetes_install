docker rm -f $(docker ps -qa) && 
docker rmi -f $(docker images -q) && 
docker volume rm $(docker volume ls -q) && \ 
for mount in $(mount | grep tmpfs | grep '/var/lib/kubelet' | awk '{ print $3 }') /var/lib/kubelet /var/lib/rancher; do umount $mount; done && \
umount -f $(mount -l | grep kubelet | awk '{print $3}')
