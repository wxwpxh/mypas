Program Example02w;
var
	i:integer;
	sum:real;	
begin
	sum:=0;
	i:=0;
	while  i<100 do
	begin
		i:=i+1;
		sum:=sum+1/i
	end;	
	WriteLn('sum=',sum);
end.
