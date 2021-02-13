if [ -z "$1" ]; then
	echo "U forgot the domains list dumbo"
	exit
fi
function killer () {
	kill %1 %2 %3 %4 %5
	exit
}

#trap killer SIGTERM
trap killer 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

TMPLOC=`mktemp -d`

cp "$1" "$TMPLOC/hosts"
echo "$TMPLOC : $$ : `date '+%Y-%m-%d %T'`" >> ~/monsterlogs

touch $TMPLOC/{initial_subdomains,alive_subdomains_with_port,initial_endpoints_with_passive,alive_endpoints,all_endpoints,all_endpoints_with_reflections}

(./subdomain_finder.sh $TMPLOC >> $TMPLOC/subdomain_log & )
(./port_scan.sh $TMPLOC >> $TMPLOC/port_scan_loh & )
(./passive_urls.sh $TMPLOC >> $TMPLOC/passive_log & )
(./spidering.sh $TMPLOC >> $TMPLOC/spider_log & )
(./endpoint_bruteforce.sh $TMPLOC >> $TMPLOC/brute_force_log & )
(./Wordlists.sh $TMPLOC >> $TMPLOC/wordlist_log & )
(./ssti.sh $TMPLOC >> $TMPLOC/ssti_log &)
(./secrets.sh $TMPLOC >> $TMPLOC/secetes_log &)
(./sql_finder.sh $TMPLOC >> $TMPLOC/sql_injection_log &)
(./xss_basic.sh $TMPLOC >> $TMPLOC/xss_basic_log & )
