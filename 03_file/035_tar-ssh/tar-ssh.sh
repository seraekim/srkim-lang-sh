# tar 아카이브를 작성해서 원격 호스트에 복사하면서 중간 파일을 만들지 않고 직접 복사하고 싶을 때
username="user1"
server="192.168.1.5"

# c 아카이브 작성, v 처리 파일 표시, f 아카이브 파일 사용, - 표준출력에표시
# 이대로는 화면자체에 출력이 되므로 cat을 사용
#tar cvf - myapp/log | ssh ${username}@${server} "cat > /backup/myapplog.tar"

# 예제와 반대의 경우를 하고 싶다면..
#ssh ${username}@${server} "cat /backup/myapplog.tar" | tar xvf -

# gzip 압축도 같이 하고 싶다면, z 옵션 추가


