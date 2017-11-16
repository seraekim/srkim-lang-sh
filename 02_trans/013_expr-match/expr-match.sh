#!/bin/sh

# expr
# 변수 내부 문자열에서 특정 패턴과 일치하는 부분을 추출할 때
# expr 변수명:패턴
# expr 명령어는 무거운 명령어라 느리다. sed awk 추천

# string="This is a pen."
# expr "$string" : "This is a \(.*\)."

# html attribute 는 따옴표로 감싸지므로..
quote="[\"']"

# 따옴표 기호 속 문자열이므로, 따옴표외의 문자열이 되므로 ^로 부정
match="[^\"']*"

while read line; do
  href=$(expr "$line" : ".*href=${quote}\(${match}\)${quote}.*")
  # expr 일치했을 때만 종료 status 가 0이 되므로 특수 변수 $?가 0일 때만 표시하면 됨
  if [ $? == 0 ]; then
    echo $href
  fi
done < index.html
