cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//g'|
perl -ne 'if (/^\d\d:\d\d\.\d+-/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"; $s = ""} $s.=$_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print $s}'|
# grep -P '^\d\d:\d\d\.\d+-\d+,CALL'|
perl -pe 's/^\d\d:\d\d\.\d+-//'| 
sort -rnb|
perl -pe 's/<NL>/\n/g'> events.txt
