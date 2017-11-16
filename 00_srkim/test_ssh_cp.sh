#!/bin/sh

ori_file='ktshop_v2.war'

echo -n "Enter the separator '*', then $ori_file.'*' will be backed up : "

read sep
back_up_file="ktshop_v2.war.$sep"

echo
echo "$ori_file ====== cp  ======>> $back_up_file"
echo

ip_arr=(10.220.165.48 10.220.165.44 10.220.164.110 10.220.164.250 10.220.164.249 10.220.165.57)
 
for ip in "${ip_arr[@]}"; do
    ssh jboss@$ip bash -c "'cd /jboss/applications ; cp $ori_file $back_up_file ; echo -n \"success(byte) : \" ; wc -c $back_up_file'"
done
