# rsync
# 매일 새로운 로그 파일이 생성되는 등 파일이 늘어나는 디렉터리를 효과적으로 백업하고 싶을 때

log_dir=/home/srkim/web/apache-tomcat-7.0.70/logs
bak_dir="${0%/*}/bak"

# log_dir -> bak_dir 복사
#rsync -avn "$log_dir" "$bak_dir"
rsync -av "$log_dir" "$bak_dir"

# 복사할 때는 원본과 대상의 차이를 바탕으로 갱신된 파일만 복사
# 파일 타임스탬프, 퍼미션, 소유자 정보 등 파일 속성 그대로 복사
# ssh 로 원격 복사 가능

# -a : 아카이브모드, 파일 특징을 그대로 복사
# -v : 상세모드, 실행결과 바로 확인 가능
# -n : dry-run, 실제 파일 복사 없이 처리될 대상 파일 목록만 출력

# 주의사항
# ~/logs 경우 logs 디렉터리까지도 복사되지만
# ~/logs/ 처럼 슬래시를 끝에 추가하면 자신 제외한 하위 서브 디렉터리만..
# 왠만하면 끝에는 /를 붙이지 않는 걸로 가는게 혼란 피할 수 있다.

#rsync -av "$log_dir" "user1@server1:/home/user1"
#rsync -av -e ssh "$log_dir" "user1@server1:/home/user1"
# rsync 는 차분갱신을 하는데, 원본에서 삭제된 파일은 복사대상에서는 삭제되지 않는다. 완전히 동기화 할거라면 delete 옵션 준다.
#rsync -av --delete "$log_dir" "user1@server1:/home/user1"
