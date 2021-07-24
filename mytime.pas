program mytime;
uses sysutils;
var
 t:real;
begin
  t:=now;
  writeln((now-t)*86400:0:4);
end.
