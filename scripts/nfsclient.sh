#!/bin/bash 
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config

yum -y install nfs-utils
cat << EOF >> /etc/fstab
#NFS
${_ALCES_BUILDSERVER}:/users	/users  nfs     intr,rsize=32768,wsize=32768,_netdev 0 0
${_ALCES_BUILDSERVER}:/data	/data	nfs	intr,rsize=32768,wsize=32768,_netdev 0 0
EOF
mkdir -p /data
mkdir -p /users
