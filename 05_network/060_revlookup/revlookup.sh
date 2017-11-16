# ip 주소가 적힌 파일을 읽어서 호스트명을 함께 표시하고 싶을 때

while read ipaddr; do
  # host 명령어로 ip 주소 변환
  revlookup=$(host "$ipaddr")

  # host 명령어가 성공했는지
  if [ $? -eq 0 ]; then
    echo -n "$ipaddr,"
    # host 명령어 출려글 awk로 호스트명만 표시
    # \.$ 라는 패턴으로 일치시켜 줄 끝의 .을 빈문자열로 삭제
    echo "$revlookup" | awk '{print $NF}' | sed 's/\.$//'
  else
    echo "$ipaddr,"
  fi

  # DNS 서버 부하 경감을 위채 1초간 대기
  sleep 1
done < $1
