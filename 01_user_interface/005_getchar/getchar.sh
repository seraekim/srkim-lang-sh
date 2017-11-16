#!/bin/sh

# stty, case, dd
# 키보드에서 글자 하나가 입력되면 엔터 입력 없이 처리를 속행하고 싶을 때

echo -n "Type your Answer [y/n]: "

# 현재 터미널 설정을 셀 변수 tty_state에 백업하고
# 터미널을 raw 설정함
tty_state=$(stty -g)
stty raw
# 키보드에서 문자 하나 읽기
# bs=입출력 블록 크기, count=입력에서 출력으로 복사하는 블록 수
# dd 명령어 실행메시지는 필요 없으므로 리다이렉트해서 버림
char=$(dd bs=1 count=1 2> /dev/null)
# 터미널 설정을 원래대로 돌림
stty "$tty_state"

echo

# 입력된 문자에 따라 처리 분기
case "$char" in
  [Yy]) echo "Input: YES" ;;
  [nN]) echo "Input: NO" ;;
  *) echo "Input: WHAT?" ;;
esac
