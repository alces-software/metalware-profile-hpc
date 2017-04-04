#!/bin/bash 
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config

yum -y install postfix mailx
install_file postfixmaster /etc/postfix/main.cf
install_file postfixrewrite /etc/postfix/master-rewrite-sender

systemctl enable postfix
systemctl restart postfix
