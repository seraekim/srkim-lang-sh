#prog=$(basename "$0")
prog="${0##*/}"

# 인수가 하나가 아니면 도움말을 표시하고 종료
if [ "$#" != 1 ]; then
  echo "Usage: $prog <string>" 1>&2
  exit 1
fi

# 명령행 인수 $1 표시
echo "Start: $prog ..."
echo "Input Argument: $1"
echo "Stop: $prog ..."
