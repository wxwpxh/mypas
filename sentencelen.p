program sentencelen(input,output);
var
  ch:string;
  s,count,j:integer;
begin
  write('The sentence is :');
  readln(ch);
  s:=0;
  count:=0;
  j:=0;
repeat
  inc(j);
  if not (ch[j] in [':',',',';','''','!','?','.',' ']) then inc(s);
  if ch[j] in[' ','.','!','?'] then inc(count);
  until (j=ord(ch[0])) or (ch[j] in ['.','!','?']);
  if ch[j]<>'.' then
    writeln('It is not a sentence.')
  else
    writeln('Average length is ',s/count:10:4);
end.
