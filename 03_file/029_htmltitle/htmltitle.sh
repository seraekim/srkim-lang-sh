# 현재 디렉터리에 있는 .html 파일이 대상
for htmlfile in *.html; do
  # 파일명에서 확장자를 뺀 문자열 취득
  fname=$(basename $htmlfile .html)
  
  # <tilte> 태그 내용을 후방참조\1로 추출, 파일 출력
  sed -n "s/^.*<title>\(.*\)<\/title>.*$/\1/p" $htmlfile > output/${fname}.txt
done
