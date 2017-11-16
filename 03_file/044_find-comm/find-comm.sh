# 두 디렉터리가 비슷한 구조일 때 한쪽에만 있거나 양쪽에 있는 파일을 보기 좋게 목록화 하고 싶을 때

dir1="/home/srkim/web/apache-tomcat-7.0.70/logs"
dir2="/home/srkim/sh_lib/03_file/034_rsync/bak/logs"

(cd $dir1; find . -maxdepth 1 -type f -print | sort ) > dir1-file.lst
(cd $dir2; find . -maxdepth 1 -type f -print | sort ) > dir2-file.lst

comm dir1-file.lst dir2-file.lst

# diff 경우 동일하면 종료 status 0, 다르면 1, 에러 2
# comm 경우 항상 0, 따라서 다른 숫자라면 문제가 있는 것임

# comm -1 f1 f2, -2 -12 와 같은 옵션 줄 수 있음. 해당 열을 보는 것.. -12 는 3번째 열을 보는 것이라는데...
