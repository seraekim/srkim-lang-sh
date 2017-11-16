# 오늘이 달의 마지막 날인지 스크립트에서 판정하고 싶을 때

# +$d로 일만 출력
tomorrow=$(date "+%d" -d '1 day')

if [ "$tomorrow" = "01" ]; then
  echo "end day"
else
  echo "not end day:$(date)"
fi
