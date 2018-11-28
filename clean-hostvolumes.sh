#! /bin/bash
echo "Docker Host Master Group volume storage path : $1"
echo "Docker Host Worker Group Volume storage path : $2"


echo "Deleting existing data from volumes used for cluster master roles..."

sudo rm -rf $1/hadoop/nn/
sudo rm -rf $1/yarn/hs/
#sudo rm -rf $1/hive/postgres/pgdata/*
#sudo rm -rf $1/spark/master/logs/*
#sudo rm -rf $1/redis/data/*
#sudo rm -rf $1/airflow/dags/*
#sudo rm -rf $1/airflow/logs/*


echo "Deleting existing data from volumes used for cluster worker roles..."
sudo rm -rf $2/hadoop/dn1/
sudo rm -rf $2/hadoop/dn2/
sudo rm -rf $2/hadoop/dn3/
#sudo rm -rf $2/spark/worker1/logs/*
#sudo rm -rf $2/spark/worker2/logs/*
#sudo rm -rf $2/spark/worker3/logs/*


