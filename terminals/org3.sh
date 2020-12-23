# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
export FABRIC_CFG_PATH=$ROOT/config
export CORE_PEER_ADDRESS=localhost:10051
export CORE_PEER_LOCALMSPID=Org3MSP
export CORE_PEER_MSPCONFIGPATH=$ROOT/organizations/org3/admin/msp