# 디폴트 게이트웨이를 자동으로 얻어서 ping 명령어로 네트워크 연결을 확인하고 싶을 때

# route 명령어 ㅜㄹ력에서 디폴트 게이트웨이 얻기
# -n 현재 경로 테이블 내용을 호스트명이 아닌 IP 주소로 표시
# 첫 번째 컬럼이 "0.0.0.0"인 줄의 두 번째 컬럼을 추출
gateway=$(route -n | awk '$1 == "0.0.0.0" {print $2}')

# 디폴트 게이트웨이에 ping
# 윈도우는 4번 ICMP 패킷을 보내고 종료하지만 리눅스는 무한이라 -c 로 한번만 보내게 함
# ping 종료 status만 필요하고 출력은 필요하지 않으므로, 표준 출력 및 표준 에러 출력을 /dev/null
ping -c 1 $gateway > /dev/null 2>&1

# ping 종료 스테이터스로 성공, 실패 확인

if [ $? -eq 0 ]; then
  echo "[Success] ping -> $gateway"
else
  echo "[Failed] ping -> $gateway"
fi

# 서버 설정 차제 문제(네트워크 설정)
# 네트워크 경로 문제(LAN 케이블 빠짐)
# 디폴트 게이트웨이에 문제(전원 꺼짐)
# 여러번 ping 보내는 법은 예제114 참조
