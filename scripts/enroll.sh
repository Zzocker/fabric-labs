#/bin/bash

ROOT=$(git rev-parse --show-toplevel)
CONFIG_PATH=$ROOT/docker/config_helper.yaml

ID=$1
CA_PORT=$2
ORG_PATH=$3
if [ -d "$ORG_PATH/$ID" ];then
    rm -r $ORG_PATH/$ID
fi
mkdir "$ORG_PATH/$ID"
FOLDER_PATH="$ORG_PATH/$ID/msp"


fabric-ca-client enroll -u "http://$ID:pw@localhost:$CA_PORT" -H "$ORG_PATH/$ID"


rm -r $FOLDER_PATH/user $FOLDER_PATH/Issuer*
mv $FOLDER_PATH/cacerts/* $FOLDER_PATH/cacerts/cacert.pem
mv $FOLDER_PATH/keystore/* $FOLDER_PATH/keystore/key.pem
cp $CONFIG_PATH $FOLDER_PATH/config.yaml