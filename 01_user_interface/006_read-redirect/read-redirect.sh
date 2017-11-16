#!/bin/sh

# tty, read
# read 명령어로 파일에 읽어들이는 처리 도중에 read 명령어로 키보드에서 입력받고 싶을 때

# $ tty : /dev/pts/0
tty=`tty`
while read question; do
  echo $question
  # read 명령어 안에 read 명령어 쓰면.. 이미 표준입력은 파일이므로 제대로 동작안해..
  # 따라서 기존 터미널 자체를 리다이렉트 하면 됨
  read dir < $tty
  echo "Command: ls $dir"
  ls $dir
done < question.txt
