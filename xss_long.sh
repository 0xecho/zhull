./inputter.sh $1 all_endpoints_with_reflections | xargs -P10 -n1 -I% dalfox url % --silence | tee >(./outputter.sh $1 "potential_xss_with_valid_poc") >(./notifier.sh)
