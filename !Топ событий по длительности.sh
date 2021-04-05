cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//g'| 
grep -P '^\d\d:\d\d\.\d+-'|
perl -pe 's/^\d\d:\d\d\.\d+-//g'|
gawk -F',' '{Dur[$2]+=$1; Execs[$2]+=1} END {for (i in Dur) printf "%.3f=TotalDurationSec, %.3f=AvgDurationSec, %d=Execs, %s\n", Dur[i]/1000000, Dur[i]/Execs[i]/1000000, Execs[i], i}'|
sort -rnb|
head -n 100 > events_on_duration.txt
