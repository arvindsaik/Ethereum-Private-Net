# Modified PoW consensus

## Testing Custom Consensus

* Understand code in 'ethash' directory of 'go-ethereum'.

* Make modifications to the existing PoW consensus that is running.

* Setup the ethereum private network as follows.

* Run the consensus algorithm on close to 100 nodes.

* Many docker containers will run on each system according to the number of cores in the system.

## Ethereum-Private-Net

### Install Docker 

Follow steps in https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04 to install docker in Ubuntu.

### Run Docker

* The dockerfile present in the repository allows us to run a docker container with go-lang 1.10 running in the alpine linux distribution.

* Follow instructions in https://gist.github.com/fishbullet/04fcc4f7af90ee9fa6f9de0b0aa325ab to create a private Ethereum blockchain network and docker nodes to perform mining.







