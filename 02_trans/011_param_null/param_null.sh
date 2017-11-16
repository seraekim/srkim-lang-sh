#!/bin/sh

# 환경 변수가 설정되었으면 그 값을 쓰고 설정되지 않았으면 스크립트에서 정한 기본값을 사용하고 싶을 때
#export TMPDIR=/large/tmp

# := 는  변수가 null 이거나 빈 문자열이면  덮어쓰기를 해버린다.
#echo ":= ${TMPDIR:=/tmp_1}"
TMPDIR=''
echo "${TMPDIR}"

# :- 는 변수가 null이거나 빈 문자열이면 해당라인에서 /tmp_2를 출력, 다만 값 할당 없음.
echo ":- ${TMPDIR:-/tmp_2}"
echo "${TMPDIR}"

# :?는 변수가 null이너가 빈 문자열이면 error message  출력하고 에러내면서 스크립트 종료
echo ":? ${TMPDIR:?/error message}"
echo "${TMPDIR}"

# :+ 는 null 도 빈 문자열도 아니라면 해당라인에서 /tmp_4를 출력, 다만 값 할당 없음.
echo ":+ ${TMPDIR:+/tmp_4}"
echo "${TMPDIR}"
#echo ":= ${JAVA_HOME:-java}"
