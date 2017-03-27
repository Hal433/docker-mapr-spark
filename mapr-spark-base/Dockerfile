# Base Docker file for Apache Spark container based on MapR PACC(Persistent Application Client Container)
# for acecss to MapR CDP on CentOS/Redhat 7.x
# Version 1.0
# March xx, 2017

# For CentOS 7.3
FROM maprtech/pacc:5.2.0_2.0_centos7

# Get Spark from US Apache mirror.
ENV SPARK_VERSION 2.0.1
RUN mkdir -p /opt/mapr/spark && \
    cd /opt/mapr/spark && \
    curl http://www.us.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz | \
        tar -zx && \
    ln -s spark-${SPARK_VERSION}-bin-without-hadoop spark && \
    echo Spark ${SPARK_VERSION} installed in /opt/mapr/spark

# Make sure that the mapr user owns the files and folders in the new spark directory	
#RUN chown -R mapr:mapr spark-${SPARK_VERSION}*
	
ENV SPARK_HOME=/opt/mapr/spark-$SPARK_VERSION

WORKDIR $SPARK_HOME
ENV PATH $SPARK_HOME/bin:$PATH

#RUN cd $SPARK_HOME/conf/
#COPY spark-env.sh.template spark-env.sh


#ADD start-common.sh start-worker.sh start-master.sh /
#RUN chmod +x /start-common.sh /start-master.sh /start-worker.sh

#COPY files/spark-entrypoint.sh /entrypoints/spark-entrypoint.sh
#COPY files/inject_spark_cfg.sh /entrypoints/inject_spark_cfg.sh
#COPY files/runhistoryserver.sh /entrypoints/runhistoryserver.sh

#RUN chmod a+x /entrypoints/spark-entrypoint.sh \
#  && chmod a+x /entrypoints/runhistoryserver.sh \
#  && echo "export SPARK_DIST_CLASSPATH=$(hadoop classpath)" >> /opt/spark-$SPARK_VERSION/conf/spark-env.sh \
#  && ln -s /usr/share/java/postgresql-jdbc4.jar /opt/spark-$SPARK_VERSION/jars/postgresql-jdbc4.jar

ENTRYPOINT ["/entrypoints/spark-entrypoint.sh"]
#CMD ["/entrypoints/runhistoryserver.sh"]
