# tar 명령으로 아카이브 파일을 만들면서 특정 파일이나 디렉터리를 제외하고 싶을 때

# ls -aF myapp
# ./ ../ .svn/ bin/ etc/ log/

#tar cvf archive.tar --exclude ".svn" myapp

# log 디렉터리 제외할건데 다른 서브디렉터리 아래도 있다면 둘다 적용되니..
#tar cvf archive.tar --exclude "myapp/backup/log" myapp

# 제외할 목록이 많다면.. exclude.lst 같은 외부파일 만들어 놓고 활용
#tar cvf archive.tar -X exclude.lst myapp
