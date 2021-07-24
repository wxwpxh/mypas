program Narcissistic(input, output);
var
  x,s,e:integer;
  i,j,m,l,d:integer;
  st:string;
begin
  for x:=100 to 999 do
    begin
      str(x,st); l:=length(st); s:=0;
      for i:=1 to l do
        begin
          e:=1; val(st[i],m,d);
          for j:=1 to l do e:=e*m;
          s:=s+e;
        end;
      if s=x then writeln(x);
    end;
end.
