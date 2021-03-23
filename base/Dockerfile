FROM centos:7.4.1708
MAINTAINER zhouzhiwei <zhiweiper@163.com>

ENV BIGDATA_DIR=/opt/bigdata \
    JAVA_HOME=/opt/bigdata/core/jdk

USER root

#System Configuration
RUN rm -rf /etc/yum.repos.d/*
COPY repo/*.repo /etc/yum.repos.d/
COPY rpm/tini_0.18.0.rpm /root
RUN set -x \
    #install base tools(net-tools、nc、which)
    && yum -y install net-tools nc bind-utils  \
    #localtime configuration
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    #install tini(https://github.com/krallin/tini)
    && rpm -Uvh /root/*.rpm \
    && rm -rf /root/*.rpm \
    && echo "123456"|passwd --stdin root

#Core Operations
RUN set -x \
    && mkdir -p $BIGDATA_DIR/bin \
    && mkdir -p $BIGDATA_DIR/core \
    && mkdir -p $BIGDATA_DIR/conf \
    && mkdir -p $BIGDATA_DIR/logs \
    && mkdir -p $BIGDATA_DIR/metadata \
    && mkdir -p $BIGDATA_DIR/tmp \

#install java
ADD packages/jdk.tar.gz $BIGDATA_DIR/core
RUN ln -s $JAVA_HOME/bin/* /usr/bin

WORKDIR /root

CMD ["/bin/bash"]