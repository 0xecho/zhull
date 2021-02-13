./inputter.sh $1 alive_subdomains_with_port | xargs -n1 -P5 -I% bash -c "echo % | waybackurls" | awk '!seen[$0]++' | grep --line-buffered -vE '.js|.jpg|.jpeg|.gif|.css|.tif|.tiff|.png|.ttf|.woff|.woff2|.ico|.pdf|.svg|.txt' | ./outputter.sh $1 "/initial_endpoints_with_passive"