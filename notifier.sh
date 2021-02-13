BOT_TOKEN=`cat telegram_token`
while read line; 
do
	for chat_id in `cat chat_ids`;
	do
		./telegram.sh -T "$line" -c chat_id -t $BOT_TOKEN
	done
done
