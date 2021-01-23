# cat TJ/rphost*/20112522.log|\
# perl -pe 's/xef\xbb\xbf//'|
# grep -P 'TDEADLOCK' > result.txt

# cat TJ/rphost*/20112522.log|
# perl -pe 's/xef\xbb\xbf//; s/\d\d:\d\d\.\d+-\d+,Context/,Context/'|
# perl -ne 'if (/\d\d:\d\d\.\d+-\d+/) {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print "$s\n" if defined $s; $s = ""} $s .= $_; END {$s =~ s/\r\n/<NL>/g; $s =~ s/\n/<NL>/g; print $s if defined $s}'|
# perl -ne 'print $_ if (/SDBL.+t:connectID=(2|3)/ || /TLOCK.+t:connectID=(2|3),.*AccumRg16.RECORDER/)' > result.txt
