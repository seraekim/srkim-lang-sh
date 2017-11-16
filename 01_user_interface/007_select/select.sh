#!/bin/sh

# read, case
# 키보드로 입력한 값을 써서 대화식 처리를 하고 싶을 때

while :; do
  echo "Menu:"
  echo "1) list file"
  echo "2) current directory"
  echo "3) exit"
  read number
  case $number in
    1) ls ;;
    2) pwd ;;
    3) exit ;;
    *) echo "Error: Unknown Command - $number"
  esac
  echo
done
