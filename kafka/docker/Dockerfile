FROM bigdata/base:1.0
MAINTAINER zhouzhiwei <zhouzhiwei@bonc.com.cn>

ENV KAFKA_HOME=/opt/bigdata/core/kafka \
    KAFKA_VERSION=2.11-2.2.2 \
    KAFKA_DATA_DIR=/opt/bigdata/data \
    KAFKA_LOG_DIR=/opt/bigdata/logs/kafka 

ADD packages/kafka.tar.gz $KAFKA_HOME/../

#Copy configuration generator script to bin
COPY scripts $KAFKA_HOME/bin/

RUN set -x \
    && mkdir -p $KAFKA_DATA_DIR \
    && mkdir -p $KAFKA_LOG_DIR \
    && chmod -R 755 $KAFKA_HOME/bin/ \
    && chown -R hadoop:hadoop $KAFKA_HOME \
    && chown -R hadoop:hadoop $KAFKA_DATA_DIR

USER hadoop
WORKDIR /home/hadoop