# 셸 스크립트로 CGI프로그램을 작성하고 싶을 때
# CGI 헤더 출력
echo "Content-Type: text/plain"
echo

# 명령어를 실행해서 브라우저에 표시
echo "Test CGI: updatime"
uptime
