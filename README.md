# Setting up a new cluster

## Docker Host Machine 
Choose a Docker Host either on Server of Cloud VM   
_E.g:_ My Docker Host is a Ubuntu 16.04 LTS VM on [Microsoft Azure](https://portal.azure.com). 

## Firwall Configuration
If your Docker Host is a UI less server like mine it doesn't have a browser.You will have to configure a public IP/DNS address to access any web url's mapped to host ports from docker containers.

Make sure you open the ports `8042,8080,8081,8088,8188,10002,50070,50075` on host firewall so those url's are accessible. 

## Prerequisites
1. Install the following software
   - Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce)   
   - Docker Volume Plugin : [local-persist](https://github.com/CWSpear/local-persist) . This enables to persist data on host  even when cluster containers are deleted.  

2. Create folders on Host to map container volumes to host .This is where the volume mountpoints are pointed in docker-compose.yml.   
<<<<<<< HEAD
	`
	mkdir -p /data1/dockervolumes/postgres/pgdata
	mkdir -p /data1/dockervolumes/hadoop/nn
	mkdir -p /data1/dockervolumes/spark/master/logs
	mkdir -p /data1/dockervolumes/yarn/hs
	mkdir -p /data2/dockervolumes/hadoop/dn1 /data2/dockervolumes/hadoop/dn2 /data2/dockervolumes/hadoop/dn3
	mkdir -p /data2/dockervolumes/spark/worker1/logs /data2/dockervolumes/spark/worker2/logs /data2/dockervolumes/spark/worker3/logs
	mkdir -p /data1/dockervolumes/zookeeper/zknode1/data /data1/dockervolumes/zookeeper/zknode2/data /data1/dockervolumes/zookeeper/zknode3/data
	mkdir -p /data1/dockervolumes/zookeeper/zknode1/log /data1/dockervolumes/zookeeper/zknode2/log /data1/dockervolumes/zookeeper/zknode3/log
	sudo chown root -R /data1/dockervolumes /data2/dockervolumes
	sudo chmod 777 -R /data1/dockervolumes /data2/dockervolumes
	`      
    The mounts `/data1`,`/data2` is filesystem on your Host.

3. Create isolated virtual network for cluster nodes.   
    `sudo docker network create bigdatacluster`

## Configuration
`bigdata-cluster.env` has required hostname/FQDN configuration for cluster services to talk to each other. If you change hostnames/network alias in `docker-compose.yml` make sure you update the configurations before launching the containers 

Sometimes `docker-compose.yml` itself has configuration set under `environment:` section specific to that container.   
_e.g:_ `spark_worker` containers has `spark_master` URI set.

During launch there configurations are uploaded as Environment variables and necessary configuration file properties are updated as necessary.


## Launch the Cluster

### Step-1: Build base image 
- Switch to `/base` folder   
- Build the docker image  
`sudo docker build --label project=bigdata-cluster  --tag bigdata-baseimg:0.2 .`

*Note: You can customise this image if you would like to install some additionals tools/packages. The next step uses this image as a starting point.*

### Step-2: Build the other images using a docker compose file
-  Switch back to top level folder  
`sudo docker-compose --file build-imgs.yml build`

### Step-3 : Booting up the whole cluster
- Run the below command from top level folder
`sudo docker-compose --project-name=devcluster up -d`

- To shutdown the cluster the command is
`suod docker-compose --projectname=devcluster down`  

## Cluster Resource Management
My Host has 8 cores core and 64GB RAM.  

1. Memory constraints are defined in `.env` file for each container role. The docker-compose file uses this while configuring the containers.You can modify the `.env` file as per your host specifications.  
_Note:_ Currently no resource constraints are imposed on CPU usage.  

2. If you need to reset files in mounted named volumes during cluster redeployment you can run the script `cleanup-volumes.sh`.  


## Cluster Administration via Web UI

_Hadoop_,_YARN_, _Hive_,_Spark_ all offer out of box web interfaces to ease administration and monitoring of the cluster. So I have added a Nginx Reverse proxy container to centralise access those web Url's to your docker Host.

Let's say if your Docker Host has a DNS name of `myhostmachine.com` now you can access the above url's as follows  


- Hadoop Namenode: http://myhostmachine.com:50070/dfshealth.html#tab-overview    
- Hadoop Datanodes:    
      - datanode1: http://myhostmachine.com:50075/datanode1/  
      - datanode2: http://myhostmachine.com:50075/datanode2/  
      - datanode3: http://myhostmachine.com:50075/datanode3/ 


- YARN Resourcemanager: http://myhostmachine:8088/cluster/    
- YARN Historyserver: http://myhostmachine.com:8188/applicationhistory  
- YARN Nodes:   
      - nodemanager1: http://myhostmachine.com:8042/nodemanager1/node/  
      - nodemanager2: http://myhostmachine.com:8042/nodemanager2/node/  
      - nodemanager3: http://myhostmachine.com:8042/nodemanager3/node/


- Spark master : http://myhostmachine.com:8080/  
- SparkWorkers:
     - sparkworker1: http://myhostmachine.com:8081/sparkworker1/
     - sparkworker2: http://myhostmachine.com:8081/sparkworker2/
     - sparkworker3: http://myhostmachine.com:8081/sparkworker3/
    
- Hive server : http://myhostmachine.com:10002/
