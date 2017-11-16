#!/bin/sh

echo -n "Enter the separator '*', then ktshop_v2.war.'*' will be backed up : "

read sep
sep="ktshop_v2.war.$sep"

echo
echo "ktshop_v2.war ====== cp ======>> $sep"
echo

ssh -p 9922 nowdream@1.223.211.61 bash -c "'cd ~/was ; cp test.txt $sep ; echo -n \"success(byte) : \" ; wc -c $sep'"

sep='text2.txt'

ssh -p 9922 nowdream@1.223.211.61 bash -c "'cd ~/was ; cp test.txt $sep ; ls $sep'"


