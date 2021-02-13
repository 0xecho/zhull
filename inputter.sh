# $1 -> temporary folder
# $2 -> file_names

if [ -z "$3" ]; then
	tail -f -c+1 "$1/$2" -q | grep -v -E '^$' --line-buffered
else
	tail -f -c+1 "$1/$2" "$1/$3" -q | grep -v -E '^$' --line-buffered
fi
