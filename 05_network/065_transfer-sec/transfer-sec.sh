# 어떤 서버에 임시 파일을 전송해서 통신 속도를 측정하고 싶을 때

# 전송 속도를 측정할 임시 파일 크기 지정. 단위는 킬로바이트(KB)
filesize=1024

# 전송 속도를 측정할 임시 파일명
tmpdata="tmpdata.tmp"
timefile="timecount.tmp"

# 전송에 사용할 임시 파일 작성
# dd 명령어 결과 출력을 표시하지 않아도 되므로 /dev/null 로 표준 에러 출력을 리다이렉트
# null(ascii 0x00)로 채운 1024(KB) * 1024(회) 1MB
# 만일 전송과 동시에 압축 등으로 효율이 좋아지는 경우 /dev/urandom 을 쓸 것
# 약간 애매한데, 1024회=count, 1024KB=bs(한번에 읽어들이는 크기)
dd if=/dev/zero of="$tmpdata" count=$filesize bs=1024 2> /dev/null

# FTP 접속해서 파일을 PUT
server="1.223.211.61"
port="9922"
user="nowdream"
password="nowdream"

echo "Filesize: $filesize (KB)"
echo "FTP Server: $server"

# FTP
# time -p 는 초만 표시
# 히어도큐먼트를 사용하면서 time 출력을 $tmpfile에리다이렉트
# 명령어 전체를 통째로 리다이렉트 하기 위한 처리로 서브셸 사용.
# 서브셸 사용안하면 ftp 명령어 결과만 리다이렉트 됨
#(time -p ftp -n "$server") << __EOT__ 2> "$timefile"
#user "$user" "$password"
#binary
#put "$tmpdata"
#__EOT__


# 보안 취약하다는 FTP를 쓴 이유는 scp, ssh 기반 통신은 암호화에 의한 CPU 오버헤드가 크기에
# 순수한 속도를 알 수가 없음.


# SFTP
export SSHPASS="$1"
(time -p sshpass -e sftp -oBatchMode=no -b - -P "$port" "$user@$server") << __EOT__ 2> "$timefile"
put "$tmpdata"
__EOT__

# SCP
# 암호를 입력하기를 기다려야 하므로 올바른 속도 측정이 불가
#(time -p scp -P "$port" "$tmpdata" "$user@${server}:/home/nowdream") << __EOT__ 2> "$timefile"
#__EOT__


# time 명령어 출력 결과에서 실제 시간을 얻은 후 나눠서 속도 계산
# expr 은 소수계산 못하므로 bc 사용. 파이프로 전달
realtime=$(awk '/^real / {print $2}' "$timefile")
speed=$(echo "${filesize}/${realtime}" | bc)
echo "Transfer Speed: $speed (KB/sec)"

# 임시 파일 삭제
#rm -f "$tmpdata" "$timefile"

