#! /bin/bash

echo "Shutting  down hadoop datanode deamons.."
docker exec -d hadoop-datanode1 hadoop --deamon stop datanode
docker exec -d hadoop-datanode2 hadoop --deamon stop datanode
docker exec -d hadoop-datanode3 hadoop --deamon stop datanode

echo "Shutting down hadoop namenode deamons.."
docker exec -d hadoop-namenode  hadoop --deamon stop namenode

echo "Shutting  down yarn nodemanager deamons.."
docker exec -d yarn-nodemanager1 yarn --deamon stop nodemanager
docker exec -d yarn-nodemanager2 yarn --deamon stop nodemanager
docker exec -d yarn-nodemanager3 yarn --deamon stop nodemanager


echo "Shutting down yarn historyserver deamons.."
docker exec -d  yarn-historyserver yarn --deamon stop historyserver

echo "Shutting down yarn resourcemanager deamons.."
docker exec -d  yarn-resourcemanager yarn --deamon stop resourcemanager

