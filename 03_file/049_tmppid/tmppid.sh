# 스크립트를 동시에 실행할 때 임시파일이 중복되지 않도록 하고 싶을 때

# 임시파일명을 $$ 프로세스 ID로 생성, 셸 프로세스 ID 임
tmpfile="tmp.$$"
echo "$tmpfile"

# 현재시각을 임시파일에 씀
date > $tmpfile
sleep 10

cat $tmpfile
rm -f $tmpfile

# mktemp 명령어를 쓰기도 함. 보안에는 더 좋음.
