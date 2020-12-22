<br />
<p align="center">
  <a>
    <img src="../img/fabric_logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Learn-Fabric</h3>

  <p align="center">
    Lab 01: Creating the Network
</p>

# More about Lab

The network is formed when an orderer is started. In our example network, N, the ordering service comprising a single node, OR1, is configured according to a network configuration NC4, which gives administrative rights to organization ORG0. At the network level, Certificate Authority CA0 is used to dispense identities to the administrators and network nodes of the ORG0 organization.

<p align="left">
  <a>
    <img src="../img/lab01.png" alt="lab01:Network">
  </a>
</p>

# Steps

### Start Org0's ca server (CA0)
```
  bash docker/start.sh org0ca
```
To add new identity to CA0, we would need its registrar keys and certifacts
```
  bash scripts/enroll.sh <id> <ca_port> organizations/<org_folder_path>/
  bash scripts/enroll.sh registrar 7054 organizations/org0/
```
Register following identities
  - ID : orderer1 ; Type : orderer
  - ID : admin ; Type : admin
```
  bash scripts/register.sh <id> <type> <path_of_registrar>
  bash scripts/register.sh admin admin organizations/org0/registrar/
  bash scripts/register.sh orderer1 orderer organizations/org0/registrar/
```
### Enroll certifacts
```
  bash scripts/enroll.sh admin 7054 organizations/org0
  bash scripts/enroll.sh orderer1 7054 organizations/org0
```
* [For more infformation](https://hyperledger-fabric-ca.readthedocs.io/en/release-1.4/operations_guide.html#setup-org1-s-peers)
### Create org0's msp
Folder structure should be
```
organizations/org0/msp/
├── cacerts
│   └── cacert.pem
└── config.yaml
```


* [for more information about folder Structure](https://hyperledger-fabric.readthedocs.io/en/release-2.2/msp.html#msp-setup-on-the-peer-orderer-side)

### Generate genesis.block using configtxgen
```
configtxgen -outputBlock artifacts/genesis.block -channelID ordererchannel -profile BootUp
```

### Start orderer
```bash docker/start.sh org0_orderer1```