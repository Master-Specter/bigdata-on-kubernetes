FROM bigdata/base:1.0
MAINTAINER zhouzhiwei <zhiweiper@163.com>

ENV KAFKA_HOME=/opt/bigdata/core/kafka \
    KAFKA_DATA_DIR=/opt/bigdata/data \
    KAFKA_LOG_DIR=/opt/bigdata/logs/kafka
    PATH=/opt/bigdata/core/kafka/bin:$PATH

USER root
ADD packages/kafka.tar.gz $KAFKA_HOME/../

#Copy configuration generator script to bin
COPY scripts $KAFKA_HOME/bin/

RUN set -x \
    && mkdir -p $KAFKA_DATA_DIR \
    && mkdir -p $KAFKA_LOG_DIR \
    && chmod -R 755 $KAFKA_HOME/bin/