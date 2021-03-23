FROM bigdata/base:1.0
MAINTAINER zhouzhiwei <zhouzhiwei@bonc.com.cn>

ENV ZK_HOME=/opt/bigdata/core/zookeeper \
    ZK_DATA_DIR=/var/lib/zookeeper/data \
    ZK_LOG_DIR=/var/log/zookeeper \
    ZK_DATA_LOG_DIR=/var/lib/zookeeper/log

USER root
ADD packages/zookeeper.tar.gz $ZK_HOME/..

#Copy configuration generator script to bin
COPY scripts $ZK_HOME/bin/

#Create a user for the zookeeper porcess and configure file system ownership
## for nessecary directories and symlink the distribution as a user executable
RUN set -x \
    && mkdir -p $ZK_LOG_DIR $ZK_DATA_DIR $ZK_DATA_LOG_DIR /usr/share/zookeeper /tmp/zookeeper /usr/etc/ \
    && chmod -R 755 $ZK_HOME/bin \
    && ln -s $ZK_HOME/conf/ /usr/etc/zookeeper \
    && ln -s $ZK_HOME/bin/* /usr/bin \
    && ln -s $ZK_HOME/*.jar /usr/share/zookeeper/ \
    && ln -s $ZK_HOME/lib/* /usr/share/zookeeper/