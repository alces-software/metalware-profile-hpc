#!/bin/bash
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config


yum -y install httpd

install_file httpddeployment /etc/httpd/conf.d/deployment.conf
mkdir -p /var/lib/metalware/rendered/exec/
install_file httpddeployment.kscomplete /var/lib/metalware/rendered/exec/kscomplete.php
chmod +x /var/lib/metalware/rendered/exec/kscomplete.php

service httpd start
systemctl enable httpd

