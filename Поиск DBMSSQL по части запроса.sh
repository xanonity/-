cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//'|
perl -pe 's/^\d\d:\d\d\..+,Context=/,Context=/'|
perl -ne 'if (/^\d\d:\d\d\./) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n"; $s = ""} $s .= $_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n";}'|
grep -P ',DBMSSQL,.+UPDATE.+_Const300'|
head -n 100 > DBMSSQL_on_query.txt