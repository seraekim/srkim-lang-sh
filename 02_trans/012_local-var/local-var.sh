#!/bin/sh

# local
# 함수 내부에서 변수를 다룰 때 호출한 곳에 영향어ㅡㄹ 주지 않도록 지역 변수로 정의

DIR=/var/tmp

ls_home() {
  # 변수 DIR을 함수 내부 변수로 정의
  local DIR
  DIR=~/$1
  echo "directory: $DIR"
  echo "$0 $1 $2"
  #ls $DIR
}

ls_home logdir

echo "directory: $DIR"
#ls $DIR
