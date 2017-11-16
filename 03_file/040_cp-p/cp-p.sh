bak_dir="`pwd`/bak"

# 디렉터리 복사할 때 파일 속성 그대로 백업하고 싶을 때
# -a 옵션은 -R을 포함
while getopts 'a' o; do
  case $o in
    a) cp -a myapp "$bak_dir"; exit ;;
  esac
done

# 그냥 복사
cp -R myapp "$bak_dir"

# -R 옵션에서 심볼릭 링크는 링크 자체를 복사하는데 실제 파일을 복사(-L)하고 싶고 속성유지(-p)도 할거면
# -pRL

# -a = -dpR, -d : 심볼릭 링크 자체 그대로를 복사

# 주의사항
# 스크립트 실행하는 user 가 user1 일 때
# 복사하려는 파일이 root의 것이거나 user1의 그룹이 아닌 경우
# 타임스탬프는 유지 되지만, 사용자나 그룹은 user1으로 변경이 되어버린다.

