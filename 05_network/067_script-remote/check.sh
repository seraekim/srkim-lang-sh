checkserver="8.8.8.8"
# 스크립트를 실행한 호스트명 표시
hostname

# 서버개통을 ping 명령어로 확인
ping -c 1 "$checkserver" > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "Ping to $checkserver : [OK]"
else
  echo "Ping to $checkserver : [NG]"
fi

# 이렇게 파일을 복사하지 않고도 원격으로 셸 스크립트 파일을 실행할 수 있다.
# 여러 서버에 같은 셸 스크립트를 실행하고 싶을 때 편하다.
