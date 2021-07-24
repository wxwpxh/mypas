program quadraroot(input,output);
const
  a=1;
  b=3;
  c=2;
var
  d:integer;
  X1,X2: real;
  begin
    d:=b*b-4*a*c;
    x1:=(-b+sqrt(d))/(2*a);
    x2:=(-b-sqrt(d))/(2*a);
    writeln('X1=',X1,'':6,'X2=',X2);
  readln 
end.
