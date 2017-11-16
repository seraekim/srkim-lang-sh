# 확장자가 없는 스크립트 파일에 자동으로 확장자를 부여하고 싶을 때

ext(){
   mv -v "$1" "${1}.${2}"
}

# 대상 스크립트 파일이 있는지 확인
if [ ! -f "$1" ]; then
  echo "지정한 파일을 찾지 못했습니다: $1" >&2
  exit 1
fi

# 파일 첫 줄 읽음
headline=$(head -n 1 "$1")

# 파일 첫 줄에 따라 확장자를 판정해서 부여함

case "$headline" in
  */bin/sh|*bash*) ext "$1" "sh" ;;
  *perl*) mv -v "$1" "${1}.pl" ;;
  *ruby*)  mv -v "$1" "${1}.rb" ;;
  *) echo "Unknown Type: $1"
esac

