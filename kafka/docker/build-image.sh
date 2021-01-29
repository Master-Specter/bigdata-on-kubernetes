#!/bin/bash
echo -e "\nbuild kafka image \n"
docker build -t bigdata/kafka:2.11-2.2.2 .