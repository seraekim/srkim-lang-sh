# 중요한 정보를 담은 로그 파일 등을 암호가 있는 zip으로 아카이브할 때
log_dir=/home/srkim/web/apache-tomcat-7.0.70/logs


# 암호걸린 zip으로 아카이브
zip -e -r log.zip "$log_dir"

# tar + gz 형식은 암호 걸 수 없다.
# -e Encrypt

# 위처럼 절대경로 쓰면 위의 모든 디렉터리까지 zip 파일에 들어가 버린다...
# cd로 이동해서 하는게 좋을듯 하다...
