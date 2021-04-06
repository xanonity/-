cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//g'|
perl -ne 'if (/^\d\d:\d\d\.\d+-/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\r/<NL>/g; print "$s\n"; $s = ""} $s.=$_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\r/<NL>/g; print $s}'|
grep -P '^\d\d:\d\d\.\d+-\d+,CALL.+,Context='|
perl -pe 's/^\d\d:\d\d\.\d+-//; s/,CALL,.+Context/Context/; s/,Interface.+//'|
gawk -F'Context=' '{Dur[$2]+=$1; Ex[$2]+=1} END {for (i in Dur) {printf "%.3f=TotalDurationSec %.3f=AvgDurationSec %d=Execs %s \n", Dur[i]/1000000, Dur[i]/Ex[i]/1000000, Ex[i], i} }'|
sort -rnb|
head -n 100000 > CALL_on_duration.txt