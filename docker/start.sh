# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
ENV_PATH=$ROOT/docker/.env

case $1 in 
    "org0ca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org0/docker-compose.yaml up -d org0_ca
    ;;
    "org1ca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org1/docker-compose.yaml up -d org1_ca
    ;;
    "org2ca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org2/docker-compose.yaml up -d org2_ca
    ;;
    "org3ca")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org3/docker-compose.yaml up -d org3_ca
    ;;
    "org0_orderer1")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org0/docker-compose.yaml up -d org0_orderer1
    ;;
    "org1_peer1")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org1/docker-compose.yaml up -d org1_peer1
    ;;
    "org2_peer1")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org2/docker-compose.yaml up -d org2_peer1
    ;;
    "org3_peer1")
        docker-compose --env-file $ENV_PATH -f $ROOT/organizations/org3/docker-compose.yaml up -d org3_peer1
    ;;
    *)
        echo "$1 doesn't exists"
    ;;
esac