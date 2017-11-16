# 설정된 환경 변수 목록을 얻어서 어떤 변수명이 정의되어 있는지 확인하고 싶을 때

# 미리 설정하지 않으면 에러가 발생하는 환경 변수 정의
envname="TMPVAR"

# env 명령어로 환경 변수 목록을 표시해서 cut 명령어로
# *첫번째 값을 표시 [-ㄹ 1]
# *분리자는 : [-ㅇ "="]로 표시
env | cut -f 1 -d "=" > env.lst

# 확인할 환경 변수명이 env.lst와 같은지로
# 정의되어 있는지 확인
grep -q "^${envname}$" env.lst

if [ $? -eq 0 ]; then
  # 환경 변수가 설정되어 있으면 start.sh 실행
  # grep 명령어는 일치한 줄이 있으면 종료 status 는 0이 됨.
  echo "환경 변수 $envname가 설정되어 있습니다."
else
  echo "환경 변수 $envname가 설정되어 있지 않습니다."
fi

cat env.lst

# cut 대신에 awk 쓸 수도 있음
# -F : 구분자 문자열을 지정
#awk -F='{print $1}

# if [ -z "$TESTVAR" ]; then 처럼, grep 말고 -z 로 해당 환경변수가 빈 문자열인지 확인 가능
