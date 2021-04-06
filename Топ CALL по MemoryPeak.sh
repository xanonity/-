cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//'|
perl -ne 'if (/^\d\d:\d\d\.\d+-/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"; $s = ""} $s .= $_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"}'|
grep -P ',CALL,.+Context='|
perl -pe 's/^.+Context=//; s/,Interface=.+MemoryPeak=/MemoryPeak/; s/,.+$//;'|
gawk -F'MemoryPeak' '{MP[$1]+=$2; Ex[$1]+=1} END { for (i in MP) {printf "%d-TotalMemoryPeak %.3f-AvgMomeryPeak %d-Execs %s \n", MP[i], MP[i]/Ex[i], Ex[i], i} }'|
sort -rnb|
head -n 100 > top_CALL_on_MemoryPeak.txt