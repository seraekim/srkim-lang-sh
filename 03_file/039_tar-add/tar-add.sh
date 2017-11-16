# 월별 아카이브에 목차 파일을 추가하는 등 기존 tar 아카이브에 파일을 추가하고 싶을 때

# 년월로 아카이브 파일 지정
arc_file="$(date +'%Y%m').tar"

# 오늘 날짜로 로그 파일 지정
log_file="$(date +'%Y%m%d').log"

# 월별 아카이브에 오늘 로그 추가
tar rvf $arc_file log/$log_file

# tar tf 201701.tar
