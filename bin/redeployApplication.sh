#!/bin/bash

FILE_PATH="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"

. ${FILE_PATH}/env.sh

bash -c "${ASADMIN_CMD} redeploy --name ${APP_NAME} ${EAR_FILE}"
