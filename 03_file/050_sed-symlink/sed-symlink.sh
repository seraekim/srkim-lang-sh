# sed로 파일 치환 시 심볼릭 링크를 실제 파일로 바꾸지 않게 하기


filename="target.txt"
cat <<<'
if [ ! -e "$filename" ]; then
  # 대상 파일이 존재하지 않으면 에러 종료
  echo "ERROR: File not exists." >&2
  exit 1
elif [ -h "$filename" ]; then
  # 대상 파일이 심볼릭 링크면 readlink 명령어로
  # 실제 파일을 대상으로 처리하기
  sed -i.bak "s/Hello/Hi/g" "$(readlink "$filename")"
else
  sed -i.bak "s/Hello/Hi/g" "$filename"
fi'

# target.txt 라는 심볼릭 링크가 있고
# 이 링크의 실제 파일은 ori 디렉터리에 있다.

# Hello 를 Hi 로 치환
# sed 필터 명령어이므로 보통은 입력 파일을 덮어쓰지 않는다.
# 따라서 치환한 결과로 원래 파일을 덮어쓰려면 중간파일 필요.

# $ sed "s/Hello/Hi/g" target.txt > tmp
# mv tmp target.txt

# 하지만 이런 중간 파일을 만들고 싶지 않다면 -i 옵션 사용
# sed -i/bak "s/Hello/Hi/g" target.txt 를 쓰면 링크파일이 실제 파일로 대체..

# -h 를 쓰면 링크파일인지 판별
# 맞다면 readlink 명령어로 실제 파일 경로 얻음

# $ readlink target.txt -> orig/target.txt

# 위의 분기 안타고 한방에 해결하는 방법도 있다.

sed -i.bak --follow-symlinks "s/Hello/Hi/g" "$filename"
