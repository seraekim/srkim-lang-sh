#dir="$(dirname "$0")"
dir="${0%/*}"
echo $dir
cd $dir
./called.sh

