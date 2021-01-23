# cat TJ/rphost*/20112018.log|
# perl -pe 's/\xef\xbb\xbf//'|
# grep -P 'TTIMEOUT' > result.txt
#head -n 100 > result.txt

# cat TJ/rphost*/20112018.log|
# perl -pe 's/\xef\xbb\xbf//; s/\d\d:\d\d\.\d+-\d+,Context/,Context/'|
# perl -ne 'if (/\d\d:\d\d\.\d+-\d+/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n" if defined $s; $s = ""} $s .= $_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print $s if defined $s}'|
# perl -ne 'print $_ if (/,TLOCK.+t:connectID=6.+AccumRg16.RECORDER/ || /SDBL.+t:connectID=6/)' > result.txt
#grep -P ',TLOCK.+t:connectID=6.+AccumRg16.RECORDER' > result.txt
#head -n 100 > result.txt
