#/bin/bash
# for structuring msp and tls folder of a peer or orderer
# msp/tls <path_of_the_folder>
ROOT=$(git rev-parse --show-toplevel)
CONFIG_PATH=$ROOT/docker/config_helper.yaml

FOLDER_PATH=$2
if [ ! -d "$FOLDER_PATH" ];then
    echo "$FOLDER_PATH not found"
    exit 1
fi
case $1 in 
    "msp")
        rm -r $FOLDER_PATH/user $FOLDER_PATH/Issuer*
        mv $FOLDER_PATH/cacerts/* $FOLDER_PATH/cacerts/cacert.pem
        mv $FOLDER_PATH/keystore/* $FOLDER_PATH/keystore/key.pem
        cp $CONFIG_PATH $FOLDER_PATH/config.yaml
    ;;
    "tls")
        rm -r $FOLDER_PATH/user $FOLDER_PATH/Issuer* $FOLDER_PATH/cacerts
        mv $FOLDER_PATH/keystore/* $FOLDER_PATH/server.key
        mv $FOLDER_PATH/signcerts/* $FOLDER_PATH/server.crt
        mv $FOLDER_PATH/tlscacerts/* $FOLDER_PATH/ca.crt
        rm -r $FOLDER_PATH/keystore $FOLDER_PATH/signcerts $FOLDER_PATH/tlscacerts
    ;;
    *)
        echo "$1 command not found"
    ;;
esac