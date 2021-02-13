# httprobe can also be used 
./inputter.sh $1 hosts | while read host;
do
	echo $host;
	host_file="results_`echo $host | tr :\/\\\\ _`"
	python3 /home/joeking/local/OneForAll/oneforall.py run --takeover False --port high --brute True --target $host --path "results/$host_file";
	cat "results/$host_file" | httpx -silent >> "$1/initial_subdomains"
done
