Program ex_01sum;
var
	sum1,sum2:int64;
	i:Integer;	
begin
	sum1:=0;
	sum2:=0;
	for i:=1 to 10 do
	 begin
		sum1:=sum1+i;
		sum2:=sum2+i+10;
	 end;
	WriteLn('sum1=',sum1);
	WriteLn('sum2=',sum2);
end.
