# 타임스탬프를 비교해서 어느 쪽이 오래되었는지 판단하고 싶을 때

log1="log1.log"
log2="log2.log"

filecheck() {
  if [ ! -e "$1" ]; then
    echo "ERROR: File $1 does not exist." >&2; exit 1;
  fi
}

filecheck "$log1"
filecheck "$log2"

if [ "$log1" -nt "$log2" ]; then
  echo "[$log1]->newer, [$log2]->older"
  rm $log2
else
  echo "[$log2]->newer, [$log1]->older"
  rm $log1
fi

# 만일 타임스탬프가 같다면 거짓을 반환하므로 $log1이 삭제될 것
# -nt 반대로 -ot 도 있다.
