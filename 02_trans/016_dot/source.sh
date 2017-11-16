#!/bin/sh

# 여러 셸 스크립트에서 공통된 설정값이나 함수를 사용하는데 그런 값과 함수를 외부 파일로 정의하고 싶을 때

# sh env.sh 로 셸 스크립트를 실행할 경우에는 다른 프로세스 동작일 뿐 변수 이어받지 않는다.
# shebang, shabang, sha-bang, hashbang, hash-bnag, pound-bang, hash-exclam
# 한편 bash 라면 source env.sh 라고 쓸 수 있다. 더 보기 좋다.
# 대상파일 존재하는지 체크
if [ -f ./env.sh ] && . ./env.sh ; then

nowtime
cp -i -v env.sh ./env.txt
nowtime

echo "$WORK_DIR"

fi
