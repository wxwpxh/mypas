program mystr(input,output);
var
  s : string;
begin
  s:='Hello, dear';
  writeln(s);
  s[1]:='J';    { Replace the first character with J }
  s[5]:='y';    { Replace the fifth character with y }
  writeln(s);   { Jelly, dear }
  writeln('The length of s is ',ord(s[0]));
end.
