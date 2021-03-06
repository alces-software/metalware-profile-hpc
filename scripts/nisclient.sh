#!/bin/bash
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config

yum -y install ypbind
NISDOMAIN="aht"
NISMASTER="10.10.0.11"
echo "domain $NISDOMAIN server $NISMASTER" > /etc/yp.conf
nisdomainname $NISDOMAIN
echo "NISDOMAIN=$NISDOMAIN" >> /etc/sysconfig/network
sed -i -e 's/^passwd:.*/passwd:     files nis/g' \
-e 's/^shadow:.*/shadow:     files nis/g' \
-e 's/^group.*/group:      files nis/g' /etc/nsswitch.conf
systemctl enable ypbind
systemctl start ypbind
