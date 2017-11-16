# ID 목록 파일의 끝 문자 순서대로 정렬하여 처리하고 싶을 때

tmpfile="sort.lst"

# 대상 ID 파일 확인
if [ ! -f "$1" ]; then
  echo "ID 목록 파일을 지정하세요." >&2
  exit 1;
fi

# ID 끝 문자 숫자로 목록 정렬
# rev로 문자열을 반전(앞뒤바뀜) 하고 sort 하고 다시 원래 형태로 rev
rev "$1" | sort | rev > $tmpfile

# 정렬한 ID 목록으로 리포트 작성
./report.sh $tmpfile

# 임시파일 삭제
rm -f $tmpfile


