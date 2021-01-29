#!/usr/bin/env bash
HOSTNAME=`hostname -s`
DOMAIN=`hostname -d`

function create_config()  {
    awk 'BEGIN { cmd="cp -fi /opt/bigdata/conf/kafkaconf/* $KAFKA_HOME/config"; print "n" |cmd; }'

    if [[ $HOSTNAME =~ (.*)-([0-9]+)$ ]]; then
        ORD=${BASH_REMATCH[2]}
        sed -i s"/broker.id=0/broker.id=$((ORD+1))/"g $KAFKA_HOME/config/server.properties
        if [ ! -d $KAFKA_DATA_DIR/$ORD  ]; then
          mkdir -p $KAFKA_DATA_DIR/$ORD
          sed -i "s log.dirs=/tmp/kafka-logs log.dirs=$KAFKA_DATA_DIR/$ORD g" $KAFKA_HOME/config/server.properties
        fi
    else
        echo "Failed to extract ordinal from hostname $HOSTNAME"
        exit 1
    fi
}

create_config && exec kafka-server-start.sh /opt/bigdata/core/kafka/config/server.properties