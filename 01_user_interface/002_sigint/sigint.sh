#!/bin/sh

# $ ./sigint.sh http://naver.com
# trap, exit, curl, sleep
# 시간이 오래 걸리는 처리나 무한 반복 처리에서 사용자가 도중에 끝내기 위해 ctrl+c 키를 입력하더라도 종료하기 전에 어떤 처리를 하고 싶을 때
# ctrl+c 는 sigint 키보드에 인터럽트 메시지를 날리며, kill -l 로 확인 가능
count=0
trap 'echo
      echo "Try count: $count"
      exit ' INT

while :
do
  curl -o /dev/null $1
  count=$(expr $count + 1 )
  sleep 1
done
