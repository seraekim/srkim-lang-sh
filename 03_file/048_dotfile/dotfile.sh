# 숨긴 파일만 대상으로 처리하고 싶을 때

# IFS에 줄바꿈 설정
# International Field Separator 셸이 사용하는 구분자로 해석하는 문자를 설정 하는 특수변수
# 구분자로 줄바꿈만 사용하고 스페이스와 탭은 사용안함
IFS_BAK=$IFS
#IFS='
#'
# 흠 IFS 안써도 잘만되는데 뭐가 문제일까....

# 현재 디렉터리 아래에 있는 파일을 $filename으로 순서대로 처리
# ls .* 으로하면 . .. 이 출력되므로 문제.. -A 사용
# -F 옵션을 쓰면 마지막에 /를 붙이므로 이것을 보고 디렉터리인지 파별할 수 있음
for filename in $(ls -AF /home/srkim);do
  case "$filename" in
    .*/) echo "dot directory: $filename" ;;
    .*) echo "dot file: $filename" ;;
  esac
done

IFS=$IFS_BAK

# 자주 쓰는 닷파일
# .bash_profile : bash 로그인 시 읽어들이는 환경 설정 파일
# .mysql_history : mysql 명령어 실행 이력 파일
# .DS_Store : 파인더가 사용하는 폴더 정보 파일(Mac 용)
# .ssh/ : ssh 접속용 키 파일 등을 저장, 비밀키를 포함하고 있으므로 주의가 필요
# .svn/ : 서브버전 작업 복사 관리 디렉터리
# .git/ : Git 리포지터리 관리 디렉터리


