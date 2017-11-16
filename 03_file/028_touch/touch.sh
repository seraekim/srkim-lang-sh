timestamp="201701010123.45"

# 파일 타임스탬프 갱신
# -c 옵션이 있으므로 lock 파일은 신규 파일을 만들지 않음
touch -t $timestamp app1.log
touch -c -t $timestamp lock.tmp

# atime access time
# mtime modify time
# ctime change time

# stat touch.sh

# touch -t - a, m
# -a - a
# -m - m

# if문으로 확인하는 법도 있지만 -c 옵션주는게 훨 좋다.
#if [ -e lock.tmp ]; then
#  touch -t $timestamp lock.tmp
#fi

# find -mtime
