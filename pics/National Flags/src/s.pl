#!perl -w

open I, 'codes-ru.txt';
open O, '>sql.sql';

$cid = 0;
while (<I>){
  chomp;
  @a = split /\|/;
  print O "INSERT INTO COUNTRIES (CID,SHORTNAME,NAME,DELETED) VALUES ($cid, '$a[1]', '$a[3]', 0);\n";
  ++$cid;
}

close I;
close O;
