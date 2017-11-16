#!/bin/sh

# stty, read
# 사용자가 암호를 입력하는 처리에서 입력된 문자열을 화면에 표시하고 싶지 않을 때

echo -n "Password : "
stty -echo
read pw
stty echo
echo
echo "you wrote pw as $pw"
