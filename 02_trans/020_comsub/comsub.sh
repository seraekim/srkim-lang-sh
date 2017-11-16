err_cnt=$(grep -c "POST" /home/srkim/web/apache-tomcat-7.0.70/logs/localhost_access_log.2016-07-25.txt)
echo "post cnt: $err_cnt"
# hostname 명령어 호출
# 원래대로라면 파일명에 명령어 치환으로 $(hostname).log 처럼 처리할 수 있다.
echo $(hostname)
echo ${hostname}
echo $hostname

# yyyymmdd 형식
date_str=`date +%Y%m%d`
echo $date_str

# '~\'hostname\`.log' escape 필요

