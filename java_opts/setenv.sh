#!/bin/sh
if [ ! -z ${DEBUG} ]; then
    set -x
    echo ">>>>>>======  ENV FOR DEBUG"
    env | grep -iv "TOKEN\|SECRET"
    echo "======<<<<<<  END ENV FOR DEBUG"; echo ""; echo ""
fi

OPTIONS=""
OPTIONS="${OPTIONS} -javaagent:/app/newrelic/newrelic.jar -Dnewrelic.environment=${ENV}"
OPTIONS="${OPTIONS} -DANCESTRY_ENVIRONMENT=${ENV}"
OPTIONS="${OPTIONS} -Dnewrelic.config.send_jvm_props=false"

if [ ! -z ${JVM_GC_TIME_RATIO} ]; then 
    OPTIONS="${OPTIONS} -XX:GCTimeRatio=${JVM_GC_TIME_RATIO}"
fi
if [ ! -z ${JVM_MAX_RAM_PERCENTAGE} ]; then 
    OPTIONS="${OPTIONS} -XX:MaxRAMPercentage=${JVM_MAX_RAM_PERCENTAGE}"
fi
if [ ! -z ${JVM_GC_TYPE} ]; then
    OPTIONS="${OPTIONS} -XX:+${JVM_GC_TYPE}"
fi
if [ ! -z ${JVM_USE_STRING_DEDUPLICATION} ] && [ ${JVM_USE_STRING_DEDUPLICATION} != "0" ]; then 
    OPTIONS="${OPTIONS} -XX:+UseStringDeduplication"
fi
if [ ! -z ${JVM_ALWAYS_PRE_TOUCH} ] && [ ${JVM_ALWAYS_PRE_TOUCH} != "0" ]; then
    OPTIONS="${OPTIONS} -XX:+AlwaysPreTouch"
fi
if [ ! -z ${JVM_PARALLEL_REF_PROC_ENABLED} ] && [ ${JVM_PARALLEL_REF_PROC_ENABLED} != "0" ]; then
    OPTIONS="${OPTIONS} -XX:+ParallelRefProcEnabled"
fi
export OPTIONS

java ${OPTIONS} -jar ${JAVA_APP_JAR}
