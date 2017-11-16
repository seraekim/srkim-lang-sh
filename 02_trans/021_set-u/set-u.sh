
# set
# 스크리븥에서 정의 안 된 변수를 사용하면 에러 종료하고 싶을 때

set -u

COPY_DIR=/mm/mm/mm
cp set-u.sh $COP_DIR

# 만일 아래 주석이 실행 된다면 리눅스는 날라가버림..
# $COP_DIR 는 선언된 적이 없는 것으로 빈문자열이라
# rm -rf / 와도 같기 때문이다.
#rm -rf $COP_DIR/

# 만약에 명령행 인수 $1 $2 $3.. 을 유동적으로 쓰는 상황이라면
# 인수가 할당 안되어도 스크립트는 에러 종료 될 테니 잘 판단해서 써야 함.
