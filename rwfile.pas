program rwfile(input,output);
var
  t,f:text;
  i:integer;
begin
  reset(t,'a.txt');
  rewrite(f,'b.txt');

  read(i);{read from key}
  writeln(f,i);{write to file}
  writeln('write to file b.txt ',i);
  read(t,i);{read from file}
  writeln(i,' is read from file a.txt');{write to screen}
end.
