#!/bin/bash
echo -e "\nbuild zookeeper image\n"
docker build -t bigdata/zookeeper:3.4.13 .