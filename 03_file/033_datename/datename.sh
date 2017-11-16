config="myapp.conf"
bak="${config}.$(date '+%Y%m%d')"

# 이미 같은 파일명이 있으면 초까지 넣어서 백업파일 작성
if [ -e $bak ]; then
  bak="${config}.$(date '+%Y%m%d%H%M.%S')"
fi

# -v : verbose, old -> new
cp -v "$config" "$bak"

# Y : 2017
# y : 17 
