# -mc all -ac "-ac flag + 302, 400, 404, 429, and 500-504 would get 99% of the noise"
./inputter.sh $1 alive_subdomains_with_port initial_endpoints_with_passive | while read host;
do
	ffuf -w /opt/wordlists/assetnote-wordlists/automated/httparchive_directories_1m_2020_11_18.txt -u $host/FUZZ -e .php,.sql,.asp,.aspx,.json,.bak -mc 200 -v | grep -Eo '(http|https)://[^/"].*' | httpx -silent -content-length -fl 0,43 -content-type -no-color | ./outputter.sh $1 "alive_endpoints"
done
