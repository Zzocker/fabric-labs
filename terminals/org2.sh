# /bin/bash

ROOT=$(git rev-parse --show-toplevel)
export FABRIC_CFG_PATH=$ROOT/config
export CORE_PEER_ADDRESS=localhost:9051
export CORE_PEER_LOCALMSPID=Org2MSP
export CORE_PEER_MSPCONFIGPATH=$ROOT/organizations/org2/admin/msp