#!/bin/bash
P1=$1
P2=$2
ssh asterisk.remoto@voip.vert.com.br "./ami_agent_server.sh $P1 $P2"
