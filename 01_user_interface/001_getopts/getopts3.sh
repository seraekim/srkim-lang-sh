#!/bin/bash

# 'getopts' 는 스크립트로 넘어온 명령어줄 인자를 처리해 줍니다.
# 인자들은 "옵션"(플래그)과 해당 인자로 파싱됩니다.

# 이렇게 실행시켜 보세요.
# 'scriptname -mn'
# 'scriptname -oq qOption' (qOption 은 아무런 문자열이면 됩니다.)
# 'scriptname -qXXX -r'
#
# 'scriptname -qr'    - 원하던 결과가 안 나오는데, "r"이 "q" 옵션의 추가 인자로 처리되기 때문입니다.
# 'scriptname -q -r'  - 위와 똑같이 원치 않는 결과.
# 어떤 옵션에 추가 인자("flag:")가 필요하다고 설정이 되면 
# 명령어줄에서 자기 바로 다음에 나오는 것을 무조건 자신의 인자로 받아들입니다.

NO_ARGS=0 
OPTERROR=65

echo "$NO_ARGS"
if [ $# -eq 0 ]  # 인자 없이 불렸군요.
then
  echo "-1- 사용법: `basename $0` options (-mnopqrs)"
  exit $OPTERROR          # 인자가 주어지지 않았다면 사용법을 알려주고 종료.
fi  
# 사용법: scriptname -options
# 주의: 대쉬(-)가 필요합니다.


while getopts ":mnopq:rs" Option
do
  case $Option in
    m     ) echo "1번 시나리오: option -m-";;
    n | o ) echo "2번 시나리오: option -$Option-";;
    p     ) echo "3번 시나리오: option -p-";;
    q     ) echo "4번 시나리오: option -q-, \"$OPTARG\"를 줘서";;
    # 'q' 옵션은 추가 인자가 있어야 하는데 없다면 디폴트로 처리됩니다.
    r | s ) echo "5번 시나리오: option -$Option-"'';;
    *     ) echo "구현되지 않은 옵션이 선택됐습니다.";;   # 디폴트
  esac
done

shift $(($OPTIND - 1))
# 인자 포인터를 감소시켜서 다음 인자를 가르키게 합니다.

exit 0
