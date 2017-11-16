# 특정 서버와 통신 상태를 조사하고 싶을 때

ipaddr="8.8.8.8"
count=10

echo "Ping to: $ipaddr"
echo "Ping count: $count"
echo "Ping average[ms]:"

# ping 명령어 실행 결과를 임시 파일에 출력
# -c 로 실행 횟수 지정
# 표시 결과를 나중에 계산하기 위해 임시파일생성
ping -c $count $ipaddr > ping.$$

# time=4.32 ms 부분을 sed로 추출, awk로 평균값 계산
# NR은 awk 내장 변수로 입력한 레코드 수
sed -n "s/^.*time=\(.*\) ms/\1/p" ping.$$ |\
awk '{sum+=$1} END{print sum/NR}'

# 임시 파일 삭제
rm -f ping.$$

# icmp_seq 실행 횟수
# ttl 라우터를 몇 번 넘었는가
# time 응답시간 밀리초
# rtt rond trip time 패킷 왕복 시간, avg ping 명령어 자체의 평균 응닶시간


