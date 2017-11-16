# 다른 프로그램과 연계하기 위해 압축 형식은 gz 그대로이지만 압축률을 높이고 싶을 때
this_sh_dir=`pwd`
log_dir=/home/srkim/web/apache-tomcat-7.0.70
cd "$log_dir"

tar cf - logs | cat > ${this_sh_dir}/archive.tar 

# -9 옵션으로 압축률을 최대로 함
gzip -9 ${this_sh_dir}/archive.tar

# bzip2 명령어가 압축률 더 좋다
# 아래처럼 한방에 처리할 수도 있음.
#tar cf - "$log_dir" | gzip -9 -c > archive.tar.gz

# GZIP='-9'; export GZIP 을 하면 항상 -9 옵션이 적용된다.
