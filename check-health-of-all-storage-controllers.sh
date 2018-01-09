#!/bin/bash

#Calculate number of controllers

NUMBER=$(SMcli -d | wc -l)
NUMBER=$(expr $NUMBER - 3)

#While loop checks if there are any controllers unchecked, if so check the health status and minus the number of controllers unchecked by 1 until the number reaches zero

while [[ $NUMBER != 0 ]]
do
        LASTCTRL=$(SMcli -d | awk -v var=$NUMBER 'NR==var {print $1}')
        printf "\n Checking controller $LASTCTRL\n\n"
        SMcli -n $LASTCTRL -c "show storagearray healthstatus;"
        NUMBER=$(expr $NUMBER - 1)
done


export NUMBER=$(SMcli -d | wc -l); NUMBER=$(expr $NUMBER - 3); while [[ $NUMBER != 0 ]]; do LASTCTRL=$(SMcli -d | awk -v var=$NUMBER 'NR==var {print $1}'); printf "\n Checking controller $LASTCTRL\n\n"; SMcli -n $LASTCTRL -c "show storagearray healthstatus;"; export NUMBER=$(expr $NUMBER - 1); done

