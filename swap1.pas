program swap1(input,output); 
  type pon= ^ integer; 
  var  a,b,c: pon;
begin
  new(a); new(b ); new(c );
  a^ :=5;  b^ :=8;
  c:=a; a:=b; b:=c; 
  writeln('a=':8,a^,'b=':8,b^);
  dispose(a); dispose(b); dispose(c);
  readln
end.
