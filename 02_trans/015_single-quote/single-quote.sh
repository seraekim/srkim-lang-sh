#!/bin/sh

# 작은따옴표로 둘러싼 문자열 안에서 변수 확장이나 작은따옴표 기호를 사용
# ""와 달리 ''는 밖으로 다른 문자열/변수 등을 붙여줘서 확장이 가능하다.
price=100
str='It costs $'$price'? I can'\''t  believe it!'
echo $str
