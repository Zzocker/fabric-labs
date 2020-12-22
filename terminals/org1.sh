# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
export FABRIC_CFG_PATH=$ROOT/config
export CORE_PEER_ADDRESS=localhost:8051
export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_MSPCONFIGPATH=$ROOT/organizations/org1/admin/msp