# 디렉터리에 있는 파일과 디렉터리 수 조사하기

dir=/home/srkim
file_cnt=$(find "$dir" -maxdepth 1 -type f -print | wc -l)
dir_cnt=$(find "$dir" -maxdepth 1 -type d -print | wc -l)

dir_cnt=$(expr $dir_cnt - 1)

echo "대상 디렉터리: $dir"
echo "파일 수: $file_cnt"
echo "디렉터리 수: $dir_cnt"
