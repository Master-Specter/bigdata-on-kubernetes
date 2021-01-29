FROM centos:7.4.1708
MAINTAINER zhouzhiwei <zhouzhiwei@bonc.com.cn>

ENV BIGDATA_DIR=/opt/bigdata \
    JAVA_HOME=/opt/bigdata/core/jdk \
    BIGDATA_USER=hadoop \
    BIGDATA_GROUP=hadoop

USER root

#system configuration
#yum repo configuration
RUN rm -rf /etc/yum.repos.d/*
COPY repo/*.repo /etc/yum.repos.d/ 
#install tini(https://github.com/krallin/tini)
COPY rpm/tini_0.18.0.rpm /root
RUN set -x \
    #install base tools(net-tools、nc、which)
    && yum -y install net-tools nc bind-utils  \
    #localtime configuration
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    #install tini(https://github.com/krallin/tini)
    &&rpm -Uvh /root/*.rpm \
    && rm -rf /root/*.rpm \
    #create hadoop user and group
    && groupadd -g 1000 $BIGDATA_GROUP \
    && useradd $BIGDATA_USER -u 1000 -g $BIGDATA_GROUP \
    && echo "hadoop"|passwd --stdin $BIGDATA_USER

#core operations
RUN set -x \
    && mkdir -p $BIGDATA_DIR/bin \
    && mkdir -p $BIGDATA_DIR/core \
    && mkdir -p $BIGDATA_DIR/conf \
    && mkdir -p $BIGDATA_DIR/logs \
    && mkdir -p $BIGDATA_DIR/metadata \
    && mkdir -p $BIGDATA_DIR/tmp \
    && chown -R $BIGDATA_USER:$BIGDATA_GROUP $BIGDATA_DIR

#install java
ADD packages/jdk.tar.gz $BIGDATA_DIR/core
RUN chown -R $BIGDATA_USER:$BIGDATA_GROUP $JAVA_HOME \
    && ln -s $JAVA_HOME/bin/* /usr/bin

WORKDIR /root

CMD ["/bin/bash"]