#!/bin/sh

# pv, tar, gzip
# 시간이 오래 걸리는 파일 처리 등에서 화면에 진행 상태를 나타내고 싶을 때

DATA_DIR=`pwd`
cd $DATA_DIR
# tar - 하이픈은 명령어 출력을 파일이 아닌 표준 출력으로 보내겠다고 지정
tar cf - f1.dat f2.dat | pv | gzip > archive.tar.gz
