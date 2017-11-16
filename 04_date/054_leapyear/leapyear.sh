year=$1

if [ -n year ]; then
mod1=$(expr $year % 4)
mod2=$(expr $year % 100)
mod3=$(expr $year % 400)

if [ $mod1 -eq 0 -a $mod2 -ne 0 ] || [ $mod3 -eq 0 ]; then
  echo "leap year:$year, 0229"
else
  echo "not leap year:$year, 0228"
fi
fi

# 별로 내가 선호하는 방법은 아니지만 -a -o 를 쓰겠다면... -o 연산을 우선한다면

#if [ $a -eq 0 -a \( $b -ne 0 -o $c -eq 0 \) ]; then
