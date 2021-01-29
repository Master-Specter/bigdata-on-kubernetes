#!/bin/bash
echo -e "\nbuild bigdata base image\n"
sudo docker build -t bigdata/base:1.0 .