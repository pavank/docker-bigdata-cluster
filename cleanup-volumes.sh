#!/bin/bash

#This will delete existing data from cluster volumes to reinitialise the cluster deployment.

sudo rm -rf /data1/dockervolumes/hadoop/nn/*
sudo rm -rf /data1/dockervolumes/hive/postgres/pgdata/*
sudo rm -rf /data1/dockervolumes/spark/master/logs/*
sudo rm -rf /data1/dockervolumes/yarn/hs/*
sudo rm -rf /data1/dockervolumes/redis/data/*  
sudo rm -rf /data1/dockervolumes/airflow/dags/*  
sudo rm -rf /data1/dockervolumes/airflow/logs/*   

sudo rm -rf /data2/dockervolumes/hadoop/dn1/*
sudo rm -rf /data2/dockervolumes/hadoop/dn2/*
sudo rm -rf /data2/dockervolumes/hadoop/dn3/*
sudo rm -rf /data2/dockervolumes/spark/worker1/logs/*
sudo rm -rf /data2/dockervolumes/spark/worker2/logs/*
sudo rm -rf /data2/dockervolumes/spark/worker3/logs/*


