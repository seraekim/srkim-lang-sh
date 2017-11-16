# 스크립트에서 권한을 지정해서 파일을 작성하고 싶을 때

umask 077

# echo 명령어 출력을 권한 600인 임시 파일로 작성
echo "ID: abcd123456" > idinfo.tmp

# 파일 권한 값은 sh로 만들어지면 666
# 디렉터리는 777
# umask 가 1인 곳을 0으로 바꾼다

# 666 --> 1 1 0 1 1 0 1 1 0
# 022 --> 0 0 0 0 1 0 0 1 0
# 결과 --> 1 1 0 1 0 0 1 0 0

# 즉 077 하게 된 결과는 600이 된다.
