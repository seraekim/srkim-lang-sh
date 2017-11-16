# uptime 명령어 기록 파일 정의
log="uptime.log"

# 널 명령어로 빈 파일로 초기화
# :(널 명령어) 아무것도 출력하지 않으므로 빈 파일로 리다이렉트
:> $log

# 10초마다 6번, uptime 명령어 실행
# a b c d e f 라고 써도 상관없지만 관습적으로 숫자를..
for i in 1 2 3 4 5 6; do
  # 덮어쓰지 않도록 추가리다이렉트 >>
  uptime >> $log
  sleep 10
done

# touch 명령어를 안 쓴이유는 갱신일만 변경할뿐 빈파일 작성 못함

# cp /dev/null $log
# cat /dev/null > $log
# /dev/null 은 유닉스에서 사용하는 특별한 파일로 내용은 EOF

# true > uptime.log
