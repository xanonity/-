cat rphost*/*.log|
perl -pe 's/\xef\xbb\xbf//; s/^\d\d:\d\d\.\d+-\d+,Context/Context/'|
perl -ne 'if (/^\d\d:\d\d\.\d+-/) {$s=~s/\r\n/<NL>/g; $s=~s/\n/<NL>/g; print "$s\n"; $s=""} $s.=$_; END {$s=~s/\r\n/<NL>/g; $s=~s/\n/<NL>/g; print "$s\n"}'|
# grep -P ',TDEADLOCK,'|
# head -n 1000 > result_TTIMEOT.txt


perl -ne 'if ((/,TLOCK,.+connectID=2.+(AccumRg16.RECORDER|AccumRg66.RECORDER)/)||(/,SDBL,.+connectID=2/)) {print $_} elsif ((/,TLOCK,.+connectID=1.+(AccumRg16.RECORDER|AccumRg66.RECORDER)/)||(/,SDBL,.+connectID=1/)) {print "		$_"}'|
head -n 1000 > result_TLOCK.txt
