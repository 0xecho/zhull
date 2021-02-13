./inputter.sh $1 initial_subdomains alive_subdomains_with_port | awk '!seen[$0]++'  | while read host;
do
	gospider -a -s "$host" -t 10 -d 10 | grep --line-buffered -vE '.mp4|.mp3|.vue|.js|.jpg|.jpeg|.gif|.css|.tif|.tiff|.png|.ttf|.woff|.woff2|.ico|.pdf|.svg|.txt' | rev | cut -d' ' -f1 | rev | httpx -silent -match-regex '200|3[0-9]{2}|401|403' -no-color | ./outputter.sh $1 "all_endpoints"
done
