#!/bin/bash


#Vars

FILENAME=$PWD/config
CSV=$PWD/vpn.csv
USER=alovatt

#Cleans up old config file

mv $PWD/config $PWD/config.previous


#Defines vars and appends to config file

for i in `cat $CSV`
do
IP=`echo $i | awk -F',' '{print $3}'`
HOST=`echo $i | awk -F',' '{print $1}'`
cat >> $FILENAME << EOF

Host $HOST
        ProxyCommand ssh -q $USER@gw nc $IP 22
EOF
done

