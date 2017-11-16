#!/bin/bash

# chmod +x getopts.sh
# sh -n getopts.sh
# ./getopts.sh 1>success.log
# ./getopts.sh 2>err.log
# $ ./getopts.sh -a -p '=====sep=====' /home/nowdream
# -a 옵션이 있는지 플래그 변수 a_flag와
# -p 옵션의 인자 처리

NO_ARGS=0 
maxArgCnt=4

usage(){ echo "Usage: getopts.sh [-a][-p separator] target_dir" 1>&2; exit 1;}
a_flag=0
separator=""


while getopts "ap:" o; do
    case "${o}" in
        a)
            a_flag=1
            ;;
        p)
            separator="$OPTARG"
            ;;
       \?) echo '?' ;;
        *)
            echo '*'
            ;;
    esac
done

echo '$# : '"$#"
echo '$OPTIND : '"$OPTIND"
if [ $# -eq "$NO_ARGS" ] || (( "$#" > "$maxArgCnt" )) || (( ${OPTIND} < ${#} ))  # 인자 없이 불렸군요.
then
    usage
fi


echo '==== 원래파라미터 ===='
echo '$1 '"$1"
echo '$2 '"$2"
echo '$3 '"$3"
echo '$4 '"$4"
echo

#명령행 인수 중 옵션은 제외하고, $2를 $1로 이동시킨다
shift $(expr $OPTIND - 1 )
echo '==== expr 실행후 ===='
echo '$1 '"$1"
echo '$2 '"$2"
echo '$3 '"$3"
echo '$4 '"$4"
echo

path="$1"
echo 'path : '"$path"
# -a 옵션이 지정되었는지 쉘 변수 a_flag 값으로 판단
# "$~" 식으로 해줘야 empty string 처리도 가능해진다.
if [[ $a_flag == 1 && $path != '' ]]; then
    ls -a -- "$path"
elif [ "$a_flag" == 0 ] && [ "$path" != '' ]; then
    ls -- "$path"
fi
if [ -n "${separator}" ]; then
    echo '$separator : '"$separator"
fi
