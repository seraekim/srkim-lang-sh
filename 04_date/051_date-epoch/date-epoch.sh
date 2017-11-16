# 시간 문자열 둘을 비교해서 며칠 차이인지 계산하고 싶을 때

# 비교할 두 날짜를 변수로 정의
day1="2012/04/01 10:49:41"
day2="2012/03/30 08:31:52"

# 날짜에서 epoch 초를 어드려면 +%s
# -d 는 FreeBSD/Mac 에서 사용불가
day1_epoch=$(date -d "$day1" '+%s')
day2_epoch=$(date -d "$day2" '+%s')

echo "day1($day1): $day1_epoch"
echo "day2($day1): $day2_epoch"

# 두 날짜의 epoch 초끼리 뺀 값을
# 하루=24시간=1440분=86400초로 나누면 날짜 계산 가능

echo "day interval:"
day_interval=$(expr \( $day1_epoch - $day2_epoch \) / 86400)
echo $day_interval

# 날씨 차이가 음수도 될 수 있으니 절대갑 적용하려면 해라
