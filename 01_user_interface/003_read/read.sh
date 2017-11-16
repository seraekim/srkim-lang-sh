#!/bin/sh

# ./read.sh
# read
# 키보드에서 입력받은 값을 써서 대화형 처리를 하고 싶을 때

echo -n "Enter your ID: "
read id

echo "Now your ID is $id"
id="$id"'.12345'
echo "Id2 : $id"
