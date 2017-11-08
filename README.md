#### Must work with Sbt most time

In `build.st` we must using `sbt 0.13.16` because latest `sbt 1.0.0` not have support all libraries.

But because we submitted to `Spark 2.1.0` then Apache Spark Logging library is not existed.

We must manually download and put in `lib` directory

```uastcontextlanguage

sbt update
sbt assemblly

https://stackoverflow.com/questions/38893655/spark-twitter-streaming-exception-org-apache-spark-logging-classnotfound/39194820#39194820

```

*  Note about Spark install `/usr/local/lib/spark`, 

```uastcontextlanguage
- Must coppy /usr/local/hive/conf/hive-site.xml to /usr/local/lib/spark/conf
- Must edit spark-env.sh and spark-default.conf
- Test spark submit with spark-submit --master local  /code/spark/read.py
```
### Important note with Spark and hive.

```uastcontextlanguage
- Finally i must install hive 1.2.1 instead of 2.1.1 because dont know why 

but Spark 2.1.0 only using hive 1.2.1 metastore client.

- I user mysql to store metastoreDB of Hive.

- i need to create link for hive-site.xml in /usr/local/lib/spark/conf 

- Setting for Spark in spark-default.conf

spark.eventLog.enabled           true
spark.eventLog.dir               /tmp
spark.driver.memory              5g
spark.master                     spark://Hadoop-NameNode-01:7077
spark.driver.host		         Hadoop-NameNode-01
spark.serializer                 org.apache.spark.serializer.KryoSerializer
spark.yarn.jars                 /usr/local/lib/spark/jars/*,/usr/local/lib/spark/yarn/*
spark.sql.warehouse.dir          hdfs://localhost:9000/user/hive/warehouse

#start hiveserver2 so hue can using it.

/tmp/hive$ nohup hiveserver2 &

#install hive server using mysql as metastoredb

http://hive.praveendeshmane.co.in/hive/hive-2-1-0-installation-with-mysql-database-on-ubuntu-14-04.jsp

```