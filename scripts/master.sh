#!/bin/bash
#(c)2017 Alces Software Ltd. HPC Consulting Build Suite
#Job ID: <%=jobid%>
#Cluster: <%=cluster%>

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASEDIR/config

export ALCES_PROFILE="MASTER"

run_script base.sh
run_script networking.sh
run_script infiniband.sh
run_script deploymentserver.sh
run_script httpserver.sh
run_script nfsserver.sh
run_script nisserver.sh
run_script postfixserver.sh
