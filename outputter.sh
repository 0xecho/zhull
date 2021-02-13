# $1 -> temporary folder
# $2 -> file_name

while read line;
do
	echo $line | \
	grep -E "`cat $1/hosts | tr \\n '|'`" | \
	tee -a "$1/$2"
done