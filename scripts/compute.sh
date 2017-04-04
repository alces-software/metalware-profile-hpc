#!/bin/bash
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config

export ALCES_PROFILE="COMPUTE"

run_script base.sh
run_script networking.sh
#run_script mlx5.sh
run_script infiniband.sh
run_script nisclient.sh
run_script nfsclient.sh
run_script postfixclient.sh
