logdir=./

#최종 갱신일이 1년 이상된 오래된 파일 삭제
#find $logdir -name "*.log" -mtime +364 -print | xargs rm -fv
# rm 은 역시 위험하니 ls로 확인 먼저...
# 해당파일이 없으면 touch -t 로 1년전 테스트 파일 만들어서..
#find $logdir -name "*.log" -mtime +364 -print

# xargs 명령어는 파일목록을 인수로 받아서 명령어를 실행
# 파일명에 공백이 있는 경우 위의 것으로는 에러남
find $logdir -name "*.log" -mtime +364 -print0 | xargs -0 rm -fv
