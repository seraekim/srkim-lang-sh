logdir=/home/srkim/web/apache-tomcat-7.0.70/logs

# 확장자 .txt 파일에서 POST 문자열 검색
find $logdir -name "*.txt" -print0 | xargs -0 grep "POST" /dev/null
#find $logdir -name "*.txt" -print

# find 쓰지 않고 grep으로만 하는 경우...
# 너무 해당되는 파일이 많은 경우 ARG_MAX 값 이상이고 argument list too long 에러 발생
# $ getconf ARG_MAX
# xargs 명령어는 ARG_MAX 값을 넘지 ㅇ낳도록 인수를 적당히 나눠서 처리
# 해당 파일이 하나뿐이면 <파일명>:<일치한 줄> 형태가 아닌 <일치한줄> 로만 되어버리므로
# /dev/null 을 추가하여 파일명 명시
