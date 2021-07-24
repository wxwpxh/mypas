program mysin(input,output);
const
  PI=3.141593;
var
  i,angle:integer;
  s:real;
begin
  s:=0;
  for i:=1 to 12 do
  begin
    angle:=i*30;
    writeln('sin(x)=',sin(angle*PI/180))
  end
end.
