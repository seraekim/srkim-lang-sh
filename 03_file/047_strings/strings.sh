# 에러 메시지를 바탕으로 그 메시지를 출력하는 명령어를 찾고 싶을 때
# c 같은 바이너리 파일의 경우에도 검색이 가능하다

msg="ERROR"

# -f : 파일명 출력
strings -f /home/srkim/* | grep "$msg"

# od 명령어로 ASCII 문자열 출력하는 -c 옵션만 기억하면 됨
# $ od -c vml-.x86_64

# hexdump 로 16진수 덤프와 ASCII 문자열 셋으로 표시 가능
# $ hexdump -C vml.x86_64

# 프로그램에서 동적으로 메시지 조합 시에는 strings 명령어는 무용지물
