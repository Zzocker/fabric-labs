# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
ENV_PATH=$ROOT/docker/.env

case $1 in 
    "tlsca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/tlsorg/docker-compose.yaml up -d tls_ca
    ;;
    "org0ca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org0/docker-compose.yaml up -d org0_ca
    ;;
    "org0_orderer1")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org0/docker-compose.yaml up -d org0_orderer1
    ;;
    *)
        echo "$1 doesn't exists"
    ;;
esac