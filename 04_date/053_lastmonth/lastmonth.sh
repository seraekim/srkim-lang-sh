# 오늘 날짜에서 지난달 년월표기를 조합해서 해당 날짜가 파일명에 있는 로그 파일을 아카이브하고 싶을 때

logdir=/home/srkim/web/apache-tomcat-7.0.70/logs

# $ date -d "1 month ago" 의 문제점은오늘과 같은 날짜로 지난달이라는 것이다
# 즉 3월 30일에 위 명령어를 실행하면 2월 30일이니 곧 3월 2일이 출력된다.

thismonth=$(date '+%Y/%m/15 00:00:00')

last_yyyymm=$(date -d "$thismonth -1 month ago" '+%Y-%m')

tar cvf ${last_yyyymm}.tar ${logdir}/catalina.${last_yyyymm}*
