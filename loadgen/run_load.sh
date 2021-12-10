#!/bin/bash
set -x
# for n in *lua
# do echo fix $n
#    sed -i -e "s/^prefix.*/prefix = \"http:\/\/${WEB_UI}\/\"/" $n
# done
# echo 86400,1000 >> increasingMedIntensity.csv

java -jar httploadgenerator.jar loadgenerator &

java -jar httploadgenerator.jar director -s localhost -a ./${LOAD_PROFILE} -l ./${REQUEST_PROFILE} -o /tmp/${OUTPUT_FILE} -t ${THREADS}
