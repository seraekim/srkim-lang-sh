# DNS 서버를 통해 이름 해석을 문의해서 해당하는 IP 주소 목록을 표시하고 싶을 때

# ip 주소를 얻고 싶은 호스트명 정의
fqdn="www.google.com"

echo "Address if $fqdn"
echo "================"

# host 명령어로 ip 주소 얻기, awk 가공해서 출력
host $fqdn |\
awk '/has address/ {print $NF, "IPv4"} \
/has IPv4 address/ {print $NF, "IPv6"}'

# 대규모 사이트라면 부하 분산을 위해 동일한 FQDN
# (전체 주소 도메인 이름 : Fully Qualified Domain Name)
# $NF 란 마지막 컬럼 변수이다.

# 최소 설치 구성이면 host 명령어가 없다.
# yum install bind-utils
