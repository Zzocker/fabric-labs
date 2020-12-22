#/bin/bash

ID=$1
TYPE=$2
REGISTRAR_MSP_PATH=$3
fabric-ca-client identity add "$ID" --type "$TYPE" --secret pw -H $REGISTRAR_MSP_PATH
