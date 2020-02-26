#!/bin/sh
set -e
LOCUST_MODE=${LOCUST_MODE:-standalone}
LOCUST_MASTER_BIND_PORT=${LOCUST_MASTER_BIND_PORT:-5557}
LOCUST_FILE=${LOCUST_FILE:-locustfile.py}

LOCUST_OPTS="-f ${LOCUST_FILE} $LOCUST_OPTS"


if [ "${LOCUST_MODE}" = "master" ]; then
    LOCUST_OPTS="${LOCUST_OPTS} --master"
elif [ "${LOCUST_MODE}" = "slave" ]; then
    if [ -z "${LOCUST_MASTER_HOST}" ]; then
        echo "ERROR: MASTER_HOST is empty. Slave mode requires a master" >&2
        exit 1
    fi
    LOCUST_OPTS="${LOCUST_OPTS} --slave --master-host=${LOCUST_MASTER_HOST}"
fi

echo "Starting Locust in ${LOCUST_MODE} mode..."
echo "$ locust ${LOCUST_OPTS}"
cd /locust
exec locust ${LOCUST_OPTS}