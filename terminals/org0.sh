# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
export FABRIC_CFG_PATH=$ROOT/config
export CORE_PEER_ADDRESS=localhost:7050
export CORE_PEER_LOCALMSPID=Org0MSP
export CORE_PEER_MSPCONFIGPATH=$ROOT/organizations/org0/admin/msp