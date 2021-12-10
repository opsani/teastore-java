#!/bin/bash
set -x

WEB_UI=${WEB_UI:teastore-webui.teastore.svc}
WEB_PORT=${WEB_PORT:80}
NUM_USERS=${NUM_USERS:10}
RAMP_USERS=${RAMP_USERS:1}

java -jar ApacheJMeter.jar -t teastore_browse_nogui.jmx -Jhostname ${WEB_UI} -Jport ${WEB_PORT} -JnumUser ${NUM_USERS} -JrampUp ${RAMP_USERS} -l /tmp/mylogfile.log -n
