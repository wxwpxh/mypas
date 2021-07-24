Program Example02f;
var
	i:integer;
	sum:real;	
begin
	sum:=0;
	for i:=1 to 100 do
		sum:=sum+1/i;
	WriteLn('sum=',sum);
end.
