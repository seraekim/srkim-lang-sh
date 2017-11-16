# 로컬에 있는 셸 스크립트를 접속할 곳에 복사하지 않고 ssh로 실행하고 싶을 때

ip="1.223.211.61"
port="9922"
username="nowdream"
script="check.sh"

# sh : 비 인터렉티브셸 실행
# 이 때 표준 입력은 터미널이 할당하지 않으므로 cat 명령어로 로컬 스크립트를 실행
cat $script | ssh -p $port ${username}@${ip} "sh"
