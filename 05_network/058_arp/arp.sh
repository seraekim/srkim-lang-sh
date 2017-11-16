# 네트워크에서 IP 주소를 지정해서 대상의 물리주소를 검색하고 싶을 때

ipaddr="192.168.11.1"
# -a arp의 모든 캐쉬 표시, -n 이름 해석 안함.
# awk 필터지정할 때 괄호 쓴다. $4는 이스케이프 해준다. 안하면 확장하는 문제 있다.
macaddr=$(arp -an | awk "/\($ipaddr\)/ {print \$4}")

if [ -n "$macaddr" ]; then
  echo "$ipaddr -> $macaddr"
else
  echo "$ipaddr가 ARP 캐쉬에 없습니다."
fi

# arp 캐쉬가 없다면 대상 머신에 ping을 보내는 등의 통신이 선행되야 함
