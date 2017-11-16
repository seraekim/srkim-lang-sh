# CSV 파일에서 인수로 지정한 ID에 대응하는 특정 컬럼을 표시하고 싶을 때

csvfile="data.csv"

# ID가 지정되지 않으면 종료
if [ -z "$1" ]; then
  echo "ID를 지정하세요." >&2
  exit 1
fi

# CSV 파일이 존재하지 않으면 종료
if [ ! -f "$csvfile" ]; then
  echo "CSV 파일이 존쟇지 않습니다: $csvfile" >&2
  exit 1
fi

while read line; do
  # cut으로 컬럼 추출
  id=$(echo $line | cut -f 1 -d ',')
  name=$(echo $line | cut -f 2 -d ',')
  score=$(echo $line | cut -f 3 -d ',')

  # ID 컬럼이 인수로 지정한 ID와 일치하면 표시
  if [ "$1" = "$id" ]; then
    echo "$name"
  fi
done < $csvfile

# ID 와 일치하는 줄전체를 보고자 할 때 awk 라면...?
# F 옵션에 쉼표할당, -v 옵션으로 $1을 id에 할당
# 첫번째 컬럼값$1이 id와 일치시 출력
awk -F, -v id="$1" '$1 == id {print}' data.csv
#awk -F, -v id="$1" '$1 == id {print $1}' data.csv
