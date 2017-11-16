#!/bin/sh

# 변수명 뒤에 이어진 문자열과 변수명을 명확하게 구분하고 싶을 때
# {}를 활용하면 된다.
# $today_log, ${today}_log

today="20150125"
# 셀 변수 today가 확장
# 파일의 줄 수 표시
wc -l ${today}_log

# bash 배열 변수
#declare -a number=("z","o","t")
#number=("z","o","t")
#echo ${number[1]}
#echo $number[1]
