Program ex_01;
var
	i:integer;	
	product:int64;	
begin
	product:=1;
	for i:=1 to 15 do
		product:=product*i;
	WriteLn('product=',product);
end.
