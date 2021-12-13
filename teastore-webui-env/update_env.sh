#!/bin/bash
set -x

SETENV_SH=${SETENV_SH:-/usr/local/tomcat/bin/setenv.sh}

function update_env {
    echo "export JAVA_OPTS=\"\$JAVA_OPTS $1\"" >> $SETENV_SH
}

if [ ! -z ${JVM_GC_TIME_RATIO} ]; then update_env -XX:GCTimeRatio=${JVM_GC_TIME_RATIO}; fi
if [ ! -z ${JVM_MAX_RAM_PERCENTAGE} ]; then update_env -XX:MaxRAMPercentage=${JVM_MAX_RAM_PERCENTAGE}; fi
if [ ! -z ${JVM_GC_TYPE} ]; then update_env -XX:GCTimeRatio=${JVM_GC_TYPE}; fi
if [[ ! -z ${JVM_USE_STRING_DEDUPLICATION} && ${JVM_USE_STRING_DEDUPLICATION} == "TRUE" ]]; then update_env -XX:+UseStringDeduplication; fi
if [[ ! -z ${JVM_ALWAYS_PRE_TOUCH} && ${JVM_ALWAYS_PRE_TOUCH} == "TRUE" ]]; then update_env -XX:+AlwaysPreTouch; fi
if [[ ! -z ${JVM_PARALLEL_REF_PROC_ENABLED} && ${JVM_PARALLEL_REF_PROC_ENABLED} == "TRUE" ]]; then update_env -XX:+ParallelRefProcEnabled; fi
