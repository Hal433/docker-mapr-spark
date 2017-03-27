#!/bin/bash

# Configure Hadoop cluster settings.
#source /entrypoints/inject_hadoop_cfg.sh
#source /entrypoints/inject_spark_cfg.sh

# Create Spark logs directory in HDFS.
#hadoop fs -mkdir /spark-logs

# /OR/ Create the /apps/spark directory on MapR-FS, and set the correct permissions on the directory.
# hadoop fs -mkdir /apps/spark
# hadoop fs -chmod 777 /apps/spark

exec $@
