#!/bin/bash

function addProperty() {
  local path=$1
  local name=$2
  local value=$3

  local entry="<property><name>$name</name><value>${value}</value></property>"
  local escapedEntry=$(echo $entry | sed 's/\//\\\//g')
  sed -i "/<\/configuration>/ s/.*/${escapedEntry}\n&/" $path
}

function configure() {
   local path=$1
   local module=$2
   local envPrefix=$3

   echo "Configuring $module"
   for c in `printenv | grep "^$3.*"`
   do
      echo " Found env $c"
      env_name=${c%=*}
      env_value=${c#*=}
      config_name=${env_name#$3_}
      config_value=$env_value
      echo "  config_name: $config_name   config_value: $config_value"
      property_name=`echo $config_name | sed 's/___/-/g' | sed 's/__/_/g' | sed 's/_/./g'`
      property_value=$config_value
      echo "  -setting config $property_name=$property_value in $path"
      addProperty $path $property_name $property_value
   done
}

configure $SPARK_HOME/conf/core-site.xml core CORE_CONF
configure $SPARK_HOME/conf//yarn-site.xml yarn YARN_CONF
configure $SPARK_HOME/conf/hive-site.xml hive HIVE_SITE_CONF

cp $SPARK_HOME/conf/spark-env.sh $SPARK_HOME/conf/spark-env.sh.template
cp $SPARK_HOME/conf/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf.template
cp $SPARK_HOME/conf/slaves $SPARK_HOME/conf/slaves.template

exec $@
