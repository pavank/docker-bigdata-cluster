#! /bin/bash
echo "Docker Host Master Group volume storage path : $1"
echo "Docker Host Worker Group Volume storage path  : $2"


echo "Creating volume directories for cluster master roles..."

#mkdir -p $1/postgres/pgdata
#mkdir -p $1/redis/data
#mkdir -p $1/airflow/dags
#mkdir -p $1/airflow/logs
mkdir -p $1/hadoop/nn
#mkdir -p $1/spark/master/logs
mkdir -p $1/yarn/hs
#mkdir -p $1/zookeeper/zknode1/log $1/zookeeper/zknode2/log $1/zookeeper/zknode3/log


echo "Creating volume directories for cluster worker roles..."


mkdir -p $2/hadoop/dn1 $2/hadoop/dn2 $2/hadoop/dn3
#mkdir -p $2/spark/worker1/logs $2/spark/worker2/logs $2/spark/worker3/logs 

echo "Setting permissions for  $1 and $2."
sudo chown root -R $1 $2
sudo chmod 777 -R $1 $2
