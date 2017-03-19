#!/bin/bash

set -x

HOST_IP=$(ip route | awk '$1 == "default" {print $3}')
JENKINS_SERVER=${JENKINS_SERVER:-$HOST_IP}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-swarm}
JENKINS_HOME=${JENKINS_HOME:-$HOME}
JENKINS_USERNAME=${JENKINS_USERNAME:-user}
JENKINS_PASSWORD=${JENKINS_PASSWORD:-password}

# start swarm slave
java -jar /home/jenkins/swarm-client.jar -username $JENKINS_USERNAME -password $JENKINS_PASSWORD -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -disableClientsUniqueId -master $JENKINS_SERVER:$JENKINS_PORT $@
