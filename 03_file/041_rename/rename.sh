# 확장자가 제각각인 파일들을 하나의 확장자로 변경하고 싶을 때

# for in * 파일명 확장, 현재 디렉터리 대상
for filename in *; do
  case "$filename" in
    *.htm | *.html)
      # 파일명 앞 부분을 취득(index)
      headname=${filename%.*}
      mv "$filename" "${headname}.txt"
    ;;
  esac
done

# CentOS 의 경우에는 훨씬 간단한 방법이 있다. 우분투 데비안에서는 안됨.
#rename .htm .txt *.htm
#rename .html .txt *.html

# 주의사항
# abc.htm abc.html 의 경우에는 abc.txt 하나만 남게 된다.
