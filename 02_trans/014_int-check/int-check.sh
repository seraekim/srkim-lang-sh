#!/bin/sh

# expr 명령어 등으로 계산하기 전에 변숫값이 정수인지 확인하고 싶을 때

# 인수가 정수인지 확인
# test 명령어 출력 결과는 필요 없으므로 표준 에러 출력은 /dev/null 로 버린다.
# $? 종료 status
# 0과 같으면 -> 0
# 0과 다르면 -> 1
# 0과 비교 불가한 문자열이면 -> 2
test "$1" -eq 0 2>/dev/null

# 따라서 2보다 작으면 정수로 본다.
# 주의사항 : 0000도 문자열이 아닌 정수 0으로 인식하는 문제가 있음.
if (( $? <= 1 )); then
  echo "Argument is Integer."
  expr 10 + $1
else
  echo "Argument is not Integer."
  exit 1
fi

# 더하기 expr ~ + ~
# 빼기 expr ~ - ~
# 곱하기expr ~ \* ~
# 나누기 expr ~ / ~
# expr은 소숫점에 대응하지 않으니 정수가 아닌 값을 사칙연산하면 에러 발생
