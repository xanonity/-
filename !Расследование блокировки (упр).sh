cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//; s/\d\d:\d\d\.\d+-\d+,Context/Context/'|
perl -ne 'if (/\d\d:\d\d\.\d+-/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"; $s=""} $s.=$_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"}'|
# grep -P ',TTIMEOUT,'|
# grep -P '\d\d:\d\d\.\d+-\d{6}.*,TLOCK,.+WaitConnections=\d+'|
# head -n 100 > result_lock.txt

# perl -ne 'print $_ if (/,TLOCK,.+t:connectID=13/)||(/,SDBL,.+t:connectID=13/)'|
# head -n 100 > result_lock1.txt
