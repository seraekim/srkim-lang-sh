#!/bin/bash

# sed, eval
# 파일에 적힌 문자열을 추출해서 명령어로 실행하고 싶을 때

filename="command.htm"

# -n 은 처리 후 패턴 스페이스 내용 출력하지 않도록 함
# 아무것도 출력되지 않으니 마지막에 p 플래그를 붙여서 일치하면 패턴 스페이스 출력
# s/ 는 구분자를 /로 간다는 것이니 패턴 내부에서는 \/ 로 escape
# 일치한 줄 중 <code> 태그 부분만 추출하고 싶으니 후방참조\1 을 사용
# ()로 둘러싼 부분은 앞부터 \1 \2 \3...

# eval 로 변수 확장.
# eval 에 의해서 $filename 치환
# OS 명령어 인젝션 같은 보안 문제도 있음

# <code>
#  ...
# </code>
# 위와 같은 경우 sed 제대로 동작하지 않는다.
eval $(sed -n "s/<code>\(.*\)<\/code>/\1/p" $filename)