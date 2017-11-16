# 스크립트 초기 설정 등에서 특정 파일의 존재 확인이나 권한 확인을 하고 싶을 때

cmd="./start.sh"

if test -x "$cmd"; then
  "$cmd"
else
  echo "ERROR: -x $cmd failed." >&2; exit 1
fi

# [ 는 명령어다 다만 ] 인수가 하나더 필요하다.
# $ type [ 으로 확인 가능

# -d 파일 존재하고 디렉터리
# -e 존재
# -b 블록 스페셜 파일
# -c 캐릭터 스페셜 파일
# -f 일반 파일 (regular file)
# -L 심볼릭 링크
# -r 읽기 가능
# -w 쓰기 가능
# -x 실행 가능
# -s 크기가 0보다 큼
# -O 실행 중인 셸의 실효 사용자 ID가 소유자면 참
# -S 소켓 파일

# 비슷한 원리로 grep 명령어도 종료 status 를 가지므로 if 문에 쓸 수 있다.
# 참이면 0, 아니면 1을 반환

if grep -q "s" start.sh; then
  echo "start.sh has string [s]"
fi

# start.sh 이 directory 일 수도 있으니
#if [ -f "$cmd" -a -x "$cmd" ]; then
#if test -f "$cmd" -a -x "$cmd" ; then
