./inputter.sh $1 all_endpoints | grep '?' | qsreplace -a | awk '!seen[$0]++' | xargs -P10 -n1 -I% bash -c "echo '%' | kxss" | cut -d' ' -f 2 | ./outputter.sh $1 "all_endpoints_with_reflections"
