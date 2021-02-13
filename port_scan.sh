./inputter.sh $1 initial_subdomains | while read host;
do
	docker run --rm rustscan/rustscan -a $host -g | cut -d' ' -f3 | tr -d [] | tr , \\n | xargs -I% echo $host:% | httprobe | ./outputter.sh $1 "alive_subdomains_with_port"
done