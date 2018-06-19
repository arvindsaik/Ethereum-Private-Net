# Ethereum-Private-Net : Setup

 ### Modified go-ethereum code
 
 * Dockerfile is changed for private net setup.
 
 * eth_common directory added which has the genesis file to setup blockchain.
 
 * Make changes in the consensus if required and follow the following steps to test it in a private network.

 ### Install Docker
 Perform the following command to install specific docker engine.
 
 ```wget -qO- https://get.docker.com/ | sed 's/lxc-docker/lxc-docker-1.6.2/' | sh```
        
  ### Docker Image Setup
  
  * The dockerfile present in the repository allows us to run a docker container with go-lang 1.10 running in the alpine linux distribution. 
  * Download the required directory into remote computer using 
  
    ```
    git clone https://github.com/arvindsaik/Ethereum-Private-Net.git
    ```
    
  * Build the docker file and push to docker hub .
    
 ### Docker Swarm Setup
  * Run a manager node of the swarm [3]
  
  ```
  docker swarm init --advertise-addr=10.21.233.225
  ```
  
  * Run an overlay network 
  ```
      docker network create -d overlay nginx-net
  ```
  * Make worker nodes join the swarm using 
  ```
  docker swarm join --token SWMTKN-1-2bf9ej012bor0su2bhjv4l3g2zd3c8sfu6tvf8zw4g4ovbs63d-82kzhax32uil46i9dkm7ossuc 10.21.233.225:2377
  ```
  * Run a service with the link to the repository in docker.io as follows 
  
  ```
  docker service create   --name a1   --publish target=80,published=80   --replicas=3   --network nginx-net  -td ask97/eth_priv_net:eth_test_2
  ```
  
  * Container IP addresses can be viewed only within the system they operate in. Type the following command to view the details of the containers in the computer present in the overlay network.
  
  ```
  docker network inspect nginx-net
  ```
  
  * View the various containers running in the system using the command below. 
  
  ```
  docker ps
  ```
  
  * Access bash at each container using container ID as follows
  
  ```
  docker exec -it ylakixadlh1a bash
  ```
## Ethereum Blockchain setup
   Follow instructions in [2] to link all containers to form an Ethereum blockchain network.


## References 

  [1] https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
  
  [2] https://gist.github.com/fishbullet/04fcc4f7af90ee9fa6f9de0b0aa325ab
  
  [3] https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/






